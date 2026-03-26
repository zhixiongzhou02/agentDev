#!/usr/bin/env bash

set -euo pipefail

usage() {
  cat <<'EOF'
用法:
  ./scripts/bootstrap_repo.sh --name <项目名> --description <项目简介> --target <目标目录> [--foundation-title <基础计划标题>] [--force]

示例:
  ./scripts/bootstrap_repo.sh \
    --name "demoAgent" \
    --description "一个新的 AI Agent 项目" \
    --target /tmp/demoAgent
EOF
}

escape_sed_replacement() {
  printf '%s' "$1" | sed -e 's/[\\&|]/\\&/g'
}

PROJECT_NAME=""
PROJECT_DESCRIPTION=""
TARGET_DIR=""
FOUNDATION_TITLE="项目基础建设"
FORCE=0

while [[ $# -gt 0 ]]; do
  case "$1" in
    --name)
      PROJECT_NAME="${2:-}"
      shift 2
      ;;
    --description)
      PROJECT_DESCRIPTION="${2:-}"
      shift 2
      ;;
    --target)
      TARGET_DIR="${2:-}"
      shift 2
      ;;
    --foundation-title)
      FOUNDATION_TITLE="${2:-}"
      shift 2
      ;;
    --force)
      FORCE=1
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "未知参数: $1" >&2
      usage >&2
      exit 1
      ;;
  esac
done

if [[ -z "$PROJECT_NAME" || -z "$PROJECT_DESCRIPTION" || -z "$TARGET_DIR" ]]; then
  echo "缺少必要参数。" >&2
  usage >&2
  exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
TEMPLATE_DIR="$REPO_ROOT/templates/repo-foundation"

if [[ ! -d "$TEMPLATE_DIR" ]]; then
  echo "模板目录不存在: $TEMPLATE_DIR" >&2
  exit 1
fi

mkdir -p "$TARGET_DIR"
TARGET_DIR="$(cd "$TARGET_DIR" && pwd)"

REQUIRED_DIRS=(
  "docs/00-meta"
  "docs/01-product"
  "docs/04-delivery/plans"
  "docs/05-quality"
  ".ai"
  "specs"
  "templates"
  "scripts"
)

declare -a conflicts=()
while IFS= read -r src; do
  rel_path="${src#"$TEMPLATE_DIR"/}"
  dest_rel="${rel_path%.tmpl}"
  dest_path="$TARGET_DIR/$dest_rel"
  if [[ -e "$dest_path" && "$FORCE" -ne 1 ]]; then
    conflicts+=("$dest_rel")
  fi
done < <(find "$TEMPLATE_DIR" -type f -name '*.tmpl' | sort)

for dir_rel in "${REQUIRED_DIRS[@]}"; do
  if [[ -e "$TARGET_DIR/$dir_rel" && "$FORCE" -ne 1 && ! -d "$TARGET_DIR/$dir_rel" ]]; then
    conflicts+=("$dir_rel")
  fi
done

if [[ ${#conflicts[@]} -gt 0 ]]; then
  echo "目标目录已存在以下关键路径，已停止以避免静默覆盖:" >&2
  printf '  - %s\n' "${conflicts[@]}" >&2
  echo "如确认覆盖，请添加 --force。" >&2
  exit 1
fi

for dir_rel in "${REQUIRED_DIRS[@]}"; do
  mkdir -p "$TARGET_DIR/$dir_rel"
done

PROJECT_NAME_ESCAPED="$(escape_sed_replacement "$PROJECT_NAME")"
PROJECT_DESCRIPTION_ESCAPED="$(escape_sed_replacement "$PROJECT_DESCRIPTION")"
FOUNDATION_TITLE_ESCAPED="$(escape_sed_replacement "$FOUNDATION_TITLE")"

render_template() {
  local src="$1"
  local dest="$2"

  sed \
    -e "s|{{PROJECT_NAME}}|$PROJECT_NAME_ESCAPED|g" \
    -e "s|{{PROJECT_DESCRIPTION}}|$PROJECT_DESCRIPTION_ESCAPED|g" \
    -e "s|{{FOUNDATION_TITLE}}|$FOUNDATION_TITLE_ESCAPED|g" \
    "$src" > "$dest"
}

while IFS= read -r src; do
  rel_path="${src#"$TEMPLATE_DIR"/}"
  dest_rel="${rel_path%.tmpl}"
  dest_path="$TARGET_DIR/$dest_rel"
  mkdir -p "$(dirname "$dest_path")"
  render_template "$src" "$dest_path"
done < <(find "$TEMPLATE_DIR" -type f -name '*.tmpl' | sort)

cat <<EOF
初始化完成: $TARGET_DIR

建议按以下顺序阅读新仓库:
1. README.md
2. docs/00-meta/doc-map.md
3. .ai/loading-rules.md
4. docs/04-delivery/plans/PLAN-001-project-foundation.md
EOF
