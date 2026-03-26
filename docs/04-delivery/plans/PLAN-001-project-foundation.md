# PLAN-001 项目基础建设

## 状态

`active`

## 目的

建立一套最小但完整的仓库基础，使项目能够开始进行有纪律的 AI Agent 开发。

## 范围

这份计划覆盖仓库治理、流程定义、产品愿景、AI 加载规则以及质量追溯机制的建立。

## 计划项

| ID | Item | Status | Notes |
| --- | --- | --- | --- |
| P1 | 建立文档地图和仓库约定 | done | `docs/00-meta/doc-map.md`, `docs/00-meta/conventions.md` |
| P2 | 定义规划与实现必须遵守的工作流 | done | `docs/00-meta/workflow.md` |
| P3 | 记录初始产品愿景 | done | `docs/01-product/vision.md` |
| P4 | 定义质量与追溯规则 | done | `docs/05-quality/test-strategy.md`, `docs/05-quality/traceability.md` |
| P5 | 定义 AI 上下文加载策略 | done | `.ai/*` 基础规则文件 |
| P6 | 保留 playbook 作为方法论种子文档 | done | `docs/ai-agent-development-playbook.md` |
| P7 | 启动第一份面向实现的需求或功能计划 | next | 尚未开始 |

## 完成标准

满足以下条件时，这份计划算完成：

- 文档地图中列出的基础文档都已经存在
- 仓库为人类和 Agent 都提供了明确的入口路径
- 下一个功能可以直接挂到新的计划上，而不需要重写治理规则

## 下一步

在确定具体范围后，创建 `PLAN-002`，开始第一个真正的功能或仓库能力建设计划。
