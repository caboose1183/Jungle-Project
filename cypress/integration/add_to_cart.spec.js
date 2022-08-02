describe("Cart adding check", () => {
  it("should click on product and increase cart by 1", () => {
    cy.visit("/");


    cy.get(".nav-item .nav-link")
      .contains("0");

    cy.get("[alt='Scented Blade']").first()
      .click()

    cy.get("[type='submit']").contains('Add')
      .click()

    cy.get(".nav-item .nav-link")
      .contains("1");
  });
});
