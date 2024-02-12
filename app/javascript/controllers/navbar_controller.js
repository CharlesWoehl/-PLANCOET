import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    console.log("Hello from navbar_controller.js");
    this.updateNavbar(); // Appel initial pour mettre à jour les classes des liens
    window.addEventListener("scroll", this.updateNavbar.bind(this));
  }

  disconnect() {
    window.removeEventListener("scroll", this.updateNavbar.bind(this));
  }

  updateNavbar() {
    const isHomePage = document.location.href === "http://localhost:3000/";
    const isTransparent = this.element.classList.contains("transparent");

    if (isHomePage) {
      if (window.scrollY >= 100) {
        this.element.classList.remove("transparent");
        this.element.classList.add("white");
        this.setNavLinksClasses("text-blue");
      } else {
        this.element.classList.remove("white");
        this.element.classList.add("transparent");
        this.setNavLinksClasses("text-white");
      }
    } else {
      this.element.classList.add("white");
      this.setNavLinksClasses("text-blue");
    }
  }

  setNavLinksClasses(className) {
    const navLinks = this.element.querySelectorAll(".nav-link");
    navLinks.forEach(link => {
      link.classList.remove("text-white", "text-blue");
      link.classList.add(className);
    });
  }
}
