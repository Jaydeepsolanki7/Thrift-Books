// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"
import jquery from 'jquery'
window.jQuery = jquery
window.$ = jquery


// app/assets/javascripts/application.js

document.addEventListener("DOMContentLoaded", function() {
  const bookOrdersContainer = document.getElementById('book-orders');
  const addBookOrderButton = document.getElementById('add-book-order');

  addBookOrderButton.addEventListener('click', function(e) {
    e.preventDefault();

    // Use a unique index for each new book_order to ensure proper nested attributes
    const newIndex = new Date().getTime();

    // Create a new div and set its HTML content
    const bookOrdersDiv = document.createElement('div');
    bookOrdersDiv.classList.add('nested-fields');
    bookOrdersDiv.innerHTML = newBookOrderContent.replace(/new_book_order_\d+/g, `new_book_order_${newIndex}`);

    // Append the new div to the container
    bookOrdersContainer.appendChild(bookOrdersDiv);
  });
});
