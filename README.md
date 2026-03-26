# daxiongAgent

这个仓库定义了一个 AI Agent 系统的开发基础，重点是上下文控制、文档治理和可追溯的 TDD 纪律。

仓库当前刻意采用“先治理、后实现”的方式启动。

## 从这里开始

建议按下面顺序阅读：

1. `README.md`
2. `docs/00-meta/doc-map.md`
3. `.ai/loading-rules.md`
4. `docs/04-delivery/plans/PLAN-001-project-foundation.md`
5. `docs/ai-agent-development-playbook.md`

## 当前状态

当前仓库基础已经包含：

- 文档治理规则
- 命名与编号约定
- 必须遵守的交付流程
- 初始产品愿景
- 项目基础建设计划
- TDD 策略与追溯规则
- AI 上下文加载控制

## 当前重点

- 控制上下文加载范围，降低 token 消耗
- 先讨论结论，再把稳定结论沉淀为正式文档
- 建立文档地图，而不是让文档自由膨胀
- 实现前必须先有计划
- 用需求-设计-测试追溯链约束 TDD

## 当前原则

在仓库里能明确找到活动计划、需求来源、设计说明和测试意图之前，不应开始实现。
