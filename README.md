# appfuse
Aplicação web de exemplo gerada com Appfuse.

## Extensões
- Testes funcionais com [Demoiselle Behave](https://github.com/demoiselle/behave)
- Geração de relatórios do JBehave formatados

## Configurações
- Selenium Driver do Chrome: está fixo em `appfuse/web/src/test/resources/chromdriver`. Caso seja necessário atualizá-lo, baixar o binário [do site do Chrome Driver](http://chromedriver.chromium.org/downloads) e copiá-lo no diretório.

- Porta do Jetty: o valor padrão é **`8080`**. Configurado via propriedade do maven (`-Djetty.port=8080`).

- Testes unitários utilizam MySQL rodando na mesma máquina (`mysql://localhost:3306/appfuse`). Assume-se que o serviço estará rodando;
  - Usuário: `root`, configurável via propriedade do maven (`-Djdbc.username=root`);
  - Senha: `mysql`, configurável via propriedade do maven (`-Djdbc.password=mysql`);

- Testes unitários podem ser ignorados via parâmetro `-DskipUTs`;

- Testes de aceitação podem ser ignorados via parâmetro `-DskipITs`;

## Comandos
   - Build completa: `mvn clean install`
   - Somente executar somente testes unitários: `mvn clean test` 
   - Somente executar somente testes de aceitação: `mvn clean verify -DskipUTs`
   - Rodar a aplicação localmente: `mvn jetty:run-war`
