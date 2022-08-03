describe("User login and registering", () => {
  it("be able to login", () => {
    cy.visit("/");

    cy.get("[href='/login']")
      .contains("Login")
      .click()

    cy.get("#email")
      .type('sid@gmail.com')

    cy.get("#password")
      .type('123456789')

    cy.get("[type='submit']").contains('Submit')
      .click()

    cy.get('.navbar-nav').next().contains('Signed in')
  });

  it('signup, logout, then sign back in', () => {
    cy.visit("/");

    // Sign up
    cy.get("[href='/signup']")
      .contains("Signup")
      .click()

    cy.get("#user_first_name")
      .type('sid')

    cy.get("#user_last_name")
      .type('p')

    cy.get("#user_email")
      .type('sid2@gmail.com')

    cy.get("#user_password")
      .type('123456789')

    cy.get("#user_password_confirmation")
      .type('123456789')

    cy.get("[type='submit']").contains('Submit')
      .click()

    cy.get('.navbar-nav').next().contains('Signed in')

    // Log out
    cy.get("[href='/logout']")
      .contains("Logout")
      .click()

    // Checking logged out
    cy.get("[href='/signup']").contains('Signup')

    cy.get("#email")
      .type('sid2@gmail.com')

    cy.get("#password")
      .type('123456789')

    cy.get("[type='submit']").contains('Submit')
      .click()

    cy.get('.navbar-nav').next().contains('Signed in')
  })
});
