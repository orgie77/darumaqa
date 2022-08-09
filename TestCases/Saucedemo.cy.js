describe("Saucedemo Test", () => {
   

   it ('Log in on-site and buy good', () => {

   cy.fixture('Personaldata').then(data => {

         cy.visit('https://www.saucedemo.com')
         cy.viewport(1920, 1080)
         cy.location('protocol').should('eq','https:')

      // LOGIN

         cy.get('input[id="user-name"]')
            .type(data.username)
            .should('have.value',data.username)

         cy.get('input[id="password"]')
            .type(data.userpassword)
            .should('have.value',data.userpassword)

         cy.get('[data-test="login-button"]')
            .should('be.visible')
            .click()

         cy.get('.title')
            .should('contain', "Products")

      // ADD TO CART

         cy.get('[data-test="add-to-cart-sauce-labs-onesie"]')
            .click()

         cy.get('.shopping_cart_badge')
            .should('contain','1')

         cy.get('.shopping_cart_link')
            .click()

      // CHECKOUT

         cy.get('.title')
            .should('have.text', "Your Cart")

         cy.get('[data-test="checkout"]')
            .click()

      // CHECKOUT YOUR INFORMATION

         cy.get('.title')
            .should('have.text', "Checkout: Your Information")

         cy.get('[data-test="firstName"]')
            .type(data.firstname)
            .should('have.value',data.firstname)

         cy.get('[data-test="lastName"]')
            .type(data.lastname)
            .should('have.value',data.lastname)

         cy.get('[data-test="postalCode"]')
            .type(data.zipcode)
            .should('have.value',data.zipcode)

         cy.get('[data-test="continue"]')
            .click()

      // FINISH BUYING

         cy.get('.title')
            .should('have.text', "Checkout: Overview")

         cy.get('[data-test="finish"]')
            .click()

         cy.get('[data-test="back-to-products"]')
            .click()

      // BURGER-MENU

         cy.get('div[class="bm-burger-button"]')
            .should('be.visible')
            .click()

         cy.get('#about_sidebar_link')        
            .should('be.visible')
            .click()

         cy.get('.module-ticker > .supertitle')
            .should('have.text', "Tests completed")

      })  
   })  
})
