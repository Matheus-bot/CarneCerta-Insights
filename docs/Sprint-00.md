# Sprint 0 — Project Setup (CarneCerta Insights)

## 🎯 Objetivo da Sprint
Estruturar toda a base do projeto de análise de dados CarneCerta Insights, definindo arquitetura inicial, banco de dados, padrões e primeiros pipelines de dados.

---

## 🧱 O que foi implementado

### Estrutura do Projeto
- Repositório GitHub criado
- Estrutura de pastas definida:
  - database/
  - sql/
  - etl/
  - dw/
  - docs/
  - datasets/
  - excel/

---

### Banco de Dados
- Criação do banco CarneCertaInsights
- Modelagem inicial:
  - customers
  - products
  - sales
  - sale_items
- Definição de chaves primárias e estrangeiras

---

### ETL
- Criação da tabela analítica:
  - fact_sales_analytics
- Pipeline simples de transformação e carga de dados

---

### Data Warehouse (V1)
- Dimensões criadas:
  - dim_customers
  - dim_products
  - dim_date
- Modelo estrela (Star Schema) implementado
- View final:
  - vw_sales_full_analysis

---

### SQL Analytics (BI Layer)
KPIs desenvolvidos:
- Receita total
- Ticket médio
- Produtos mais vendidos
- Clientes mais valiosos
- Vendas por funcionário
- Produtos com baixa saída
- Faturamento por dia

---

## ⚙️ Padrões definidos
- Uso de SQL Server como banco principal
- Estrutura de projeto separada por camadas (database / etl / dw / sql)
- Versionamento via GitHub
- Queries organizadas por módulo de análise

---

## 🧠 Decisões importantes
- Uso de tabela fact para análise (fact_sales_analytics)
- Separação entre dados operacionais e analíticos
- Criação de Data Warehouse simplificado para BI
- Foco em portfólio de Analista de Dados

---

## 📊 Resultado da Sprint 0
A Sprint 0 estabeleceu toda a base técnica e estrutural do projeto, permitindo a evolução para análise de dados, BI e dashboards.

---

## 🚀 Próxima etapa
Sprint 1 — Power BI e visualização de dados