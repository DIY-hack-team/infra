## COPY data

```sql
\copy employees(ldap,organisation,name,legal_entity,business_role,cost_center,version) FROM '<infraRoot>/data/employees.csv' WITH CSV HEADER
\copy domains(domain_id, domain_tag, domain_name, domain_name_rus, status, version) FROM '<infraRoot>/data/domains.csv' WITH CSV HEADER
-- Legacy
\copy prodteams(product_team_id, product_team_name, product_team_rus, product_team_type, cost_center, status, domain_id, version) FROM '<infraRoot>/data/prodteams_with_domains.csv' WITH CSV HEADER
-- New
\copy prodteams(product_team_id, product_team_name, product_team_rus, product_team_type, cost_center, status, version) FROM '<infraRoot>/data/prodteams.csv' WITH CSV HEADER
\copy projects(id, name, it_system, employee, status, version) FROM '<infraRoot>/data/projects.csv' WITH CSV HEADER
\copy products(product_id, product_name, status, product_team_id, version) FROM '<infraRoot>/data/products.csv' WITH CSV HEADER
```
