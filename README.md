# 🥩 CarneCerta Insights

Sistema de análise de dados para simular decisões de compra em açougues, com foco em recomendação inteligente de carnes, comportamento de clientes e análise de vendas.

---

## 🎯 Objetivo do Projeto

O CarneCerta Insights tem como objetivo transformar dados de vendas de um açougue em insights estratégicos, ajudando a entender:

- Quais carnes mais vendem
- Preferências dos clientes
- Ticket médio de compras
- Performance de produtos e vendedores
- Padrões de consumo

---

## 🧱 Arquitetura do Projeto

O projeto foi dividido em camadas:

### 1. Database (OLTP)
- customers
- products
- sales
- sale_items

### 2. ETL
- fact_sales_analytics
- Transformação de dados brutos em dados analíticos

### 3. Data Warehouse (Star Schema)
- dim_customers
- dim_products
- dim_date
- fact_sales_analytics

### 4. Analytics (SQL)
- KPIs de vendas
- análise de clientes
- análise de produtos
- performance de funcionários

---

## 📊 Tecnologias Utilizadas

- SQL Server
- SQL (T-SQL)
- Git & GitHub
- Modelagem de Dados (Star Schema)
- ETL básico

---

## 🚀 Status do Projeto

Sprint 0 — Estrutura e base do sistema ✔  
Sprint 1 — Power BI (em andamento)

---

## 📌 Próximos Passos

- Desenvolvimento de dashboards no Power BI
- Expansão das análises de negócio
- Evolução do Data Warehouse