package github.com.joaquimpedrooliveira.webapp.acceptance;

import org.junit.Test;

import br.gov.frameworkdemoiselle.behave.controller.BehaveContext;

public class SmokeTest {
	private BehaveContext eng = BehaveContext.getInstance();
	
	@Test
	public void testAllStories() throws Throwable {
		eng.run("/stories");
	}

}
