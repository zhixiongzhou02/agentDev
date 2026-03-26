# 追溯性

## 目的

这份文档定义仓库工作最小必须满足的追溯契约。

## 必须具备的链路

对于重要工作，应保持以下链路：

`PLAN -> Requirement -> Design -> Test Plan or Test Case -> Code -> Verification`

## 最小字段

在适用时，应记录以下标识：

- 计划 ID
- 需求 ID
- 设计 ID
- 测试用例 ID
- 实现模块或路径
- 验证状态

## 仓库规则

如果某项测试或实现变更无法追溯回预期需求或计划，那么在澄清之前应视为可疑变更。

## 基础阶段记录

当前追溯锚点如下：

- plan ID: `PLAN-001`
- requirement source: `docs/01-product/vision.md`
- governance source: `docs/00-meta/workflow.md`
- methodology source: `docs/ai-agent-development-playbook.md`

## 当前活动实现链路

- plan ID: `PLAN-002`
- requirement ID: `FR-001`
- spec path: `specs/repository-bootstrap-kit/spec.md`
- design path: `specs/repository-bootstrap-kit/design.md`
- test plan path: `specs/repository-bootstrap-kit/test-plan.md`
- implementation path: `scripts/bootstrap_repo.sh`
- template path: `templates/repo-foundation/`
- verification status: `verified`

## 后续要求

当实现真正开始后，应继续补充测试用例 ID、实现模块路径和验证结果，而不是只停留在计划层追溯。
