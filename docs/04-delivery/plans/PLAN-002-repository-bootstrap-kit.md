# PLAN-002 仓库启动包

## 状态

`done`

## 目的

把当前示例仓库沉淀成一个可复用的仓库启动包能力，作为本项目第一个真正面向实现的交付目标。

## 需求来源

- `FR-001`

## 范围

这份计划覆盖需求固化、特性规格、设计、测试计划，以及后续启动包实现所需的模板与脚本准备。

## 计划项

| ID | Item | Status | Notes |
| --- | --- | --- | --- |
| P1 | 建立正式需求文档 `FR-001` | done | `docs/01-product/requirements/FR-001-repository-bootstrap-kit.md` |
| P2 | 建立特性规格、设计和测试计划 | done | `specs/repository-bootstrap-kit/*` |
| P3 | 设计模板目录和占位符策略 | done | `templates/repo-foundation/` |
| P4 | 实现仓库初始化脚本 | done | `scripts/bootstrap_repo.sh` |
| P5 | 验证生成结果满足治理要求 | done | 已在 `/tmp/daxiongAgent-bootstrap-test` 完成生成与防覆盖验证 |
| P6 | 把启动包使用方法接入 README 和文档地图 | done | `README.md`, `docs/00-meta/doc-map.md` |

## 完成标准

满足以下条件时，这份计划算完成：

- 新仓库可以通过明确步骤生成标准治理骨架
- 生成结果满足 `FR-001` 的关键功能需求
- 对应的验证结果已记录

## 下一步

如果继续推进，下一步应创建新的计划来扩展模板覆盖范围、增加自动化测试，或引入更多技术栈模板。
