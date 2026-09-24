# Modelagem Relacional com PostgreSQL

Projeto acadêmico desenvolvido para estudar relacionamentos entre funcionários, supervisores, dependentes, projetos e equipamentos.

## 🎯 Objetivo

Aplicar conceitos de modelagem relacional e integridade referencial utilizando PostgreSQL.

## 🛠️ Tecnologias e conceitos

- PostgreSQL e SQL.
- Chaves primárias e estrangeiras.
- Autorrelacionamento.
- Dependência de existência.
- Consultas com JOIN e LEFT JOIN.

## 🗃️ Estrutura do banco

| Tabela | Finalidade |
| --- | --- |
| `funcionario` | Armazena funcionários e uma referência opcional ao supervisor. |
| `dependente` | Armazena dependentes vinculados a um funcionário. |
| `projeto` | Armazena os projetos cadastrados. |
| `alocacao_equipamento` | Associa funcionário, projeto e nome do equipamento. |

O supervisor referencia a própria tabela `funcionario`, demonstrando um autorrelacionamento.

A tabela `dependente` utiliza `ON DELETE CASCADE`: quando um funcionário é excluído com sucesso, seus dependentes também são removidos. Outras referências ao funcionário podem impedir essa exclusão.

## ▶️ Como executar

1. Tenha o PostgreSQL instalado.
2. Crie um banco de dados vazio para este estudo.
3. Abra o Query Tool do pgAdmin nesse banco.
4. Execute o arquivo [schema.sql](projeto-bd-agregacao/schema.sql).

O script cria as tabelas, insere dados de exemplo e executa as consultas.

> Utilize um banco separado para estudos. O script não foi preparado para ser executado repetidamente no mesmo banco sem ajustes.

## 🔎 Consultas disponíveis

- Funcionários e seus supervisores.
- Dependentes e seus respectivos funcionários.
- Funcionários, projetos e equipamentos associados.

Com os dados de exemplo, a consulta de alocação retorna:

| Funcionário | Projeto | Equipamento |
| --- | --- | --- |
| Ana | Sistema Bancário | Notebook Dell |
| João | Aplicativo Mobile | Monitor LG |

A ordem das linhas não é garantida sem uma cláusula ORDER BY.

## 📌 Possíveis melhorias

- Criar uma tabela própria para cadastrar equipamentos.
- Revisar quais campos devem ter preenchimento obrigatório.
- Adicionar consultas e exemplos de regras de integridade.

## 👨‍💻 Autor

Desenvolvido por [Ricardo Amorin](https://github.com/RicardoAmorin) durante os estudos de Ciência da Computação.
