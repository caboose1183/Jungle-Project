describe("Product Checking", () => {
  it.skip("should click on product to see details", () => {
    cy.visit("/");
    
    cy.get("[alt='Giant Tea']").first()
    .click()
    
    cy.get(".product-detail").should("be.visible");
  });
});
