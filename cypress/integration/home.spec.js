describe("Home page checks", () => {
  it.skip("should visit the site", () => {
    cy.visit("/");
  });

  it.skip("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it.skip("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });
  

});



