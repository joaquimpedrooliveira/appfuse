package github.com.joaquimpedrooliveira.webapp.acceptance.pages;

import br.gov.frameworkdemoiselle.behave.annotation.ElementLocatorType;
import br.gov.frameworkdemoiselle.behave.annotation.ElementMap;
import br.gov.frameworkdemoiselle.behave.annotation.ScreenMap;
import br.gov.frameworkdemoiselle.behave.runner.ui.Button;
import br.gov.frameworkdemoiselle.behave.runner.ui.TextField;

@ScreenMap(base="http://localhost:8081/", name="Página de Login")
public class LoginPage {

	@ElementMap(name="Login", locatorType=ElementLocatorType.Id, locator="j_username")
	private TextField login;
	
	@ElementMap(name="Senha", locatorType=ElementLocatorType.Id, locator="j_password")
	private TextField password;
	
	@ElementMap(name="Botão Entrar", locatorType=ElementLocatorType.Name, locator="login")
	private Button enterButton;
}
