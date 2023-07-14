const primaryNav = document.querySelector(".primary-navigation");
const navtoggle = document.querySelector(".mobile-nav-toggle");
const navLink = document.querySelectorAll(".nav__link");
const links = Array.from(primaryNav.children);

navtoggle.addEventListener("click", () => {
    const visibility = primaryNav.getAttribute("data-visible");
    if (visibility === "false")
    {
        primaryNav.setAttribute("data-visible","true");
        navtoggle.setAttribute("aria-expanded","true");
    }
    else if (visibility === "true")
    {
        primaryNav.setAttribute("data-visible","false");
        navtoggle.setAttribute("aria-expanded","false");
    }
})

for(let i = 0; i < navLink.length;i++)
{
    navLink[i].addEventListener("click", () => {
        let currenLink = primaryNav.querySelector(".nav__link-active");
        primaryNav.setAttribute("data-visible","false");
        navtoggle.setAttribute("aria-expanded","false");
        currenLink.classList.remove("nav__link-active");
        navLink[i].classList.add("nav__link-active");
    });
}
