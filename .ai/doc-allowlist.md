# 文档白名单

## 目的

这份文档列出哪些受管控来源可以作为 Agent 默认加载的上下文。

## 默认允许加载

- `README.md`
- `docs/00-meta/doc-map.md`
- `docs/00-meta/conventions.md`
- `docs/00-meta/workflow.md`
- 活动中的 `PLAN-*`
- 直接被引用的需求、设计和质量文档
- 相关代码和测试文件

## 默认不允许加载

- 整个 `docs/` 目录的全量扫描
- 无关的计划文档
- 未受管控的笔记
- 除非决策需要，否则不加载已过时或已被替代的文档
