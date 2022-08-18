/// <reference types="cypress" />

describe('SauceDemo Social Test', () => {
  it('Open Login Page', () => {
      cy.visit('https://www.saucedemo.com')
  })
  
  it('Enter the login and password', () => {
    cy.fixture('social').then(data => {
      cy.get('[data-test="username"]').type(data.userName)
      cy.get('[data-test="password"]').type(data.userPassword)
    })
  })

  it('Click the "Login" button', () => {
    cy.get('[data-test="login-button"]').click ()
    cy.get('.title').should('contain', "Products")
  })

  // Links

  // Twitter

  it('Search and click Twitter link', () => {
    cy.visit('https://twitter.com/saucelabs')
  })

  // Facebook

  it('Search and click Facebook link', () => {
    cy.visit('https://www.facebook.com/saucelabs')
  })

  // Linkedin

  it('Search and click Linkedin link', () => {
    cy.visit('https://www.linkedin.com/company/sauce-labs')
  })
})    