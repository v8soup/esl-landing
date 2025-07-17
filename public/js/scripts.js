/*!
* Start Bootstrap - Stylish Portfolio v6.0.6 (https://startbootstrap.com/theme/stylish-portfolio)
* Copyright 2013-2023 Start Bootstrap
* Licensed under MIT (https://github.com/StartBootstrap/startbootstrap-stylish-portfolio/blob/master/LICENSE)
*/
let sidebarOutsideClickHandler = null;
let sidebarMenuHandler = null;
let sidebarScrollHandler = null;

function initSidebarMenu() {
    // Remove previous delegated click handler if it exists
    if (sidebarMenuHandler) {
        document.removeEventListener('click', sidebarMenuHandler, true);
    }
    // Remove previous scroll handler if it exists
    if (sidebarScrollHandler) {
        document.removeEventListener('scroll', sidebarScrollHandler);
    }
    // Use event delegation for menu toggle and js-scroll-trigger
    sidebarMenuHandler = function(e) {
        // Always get the latest DOM references
        const sidebarWrapper = document.getElementById('sidebar-wrapper');
        const menuToggle = document.body.querySelector('.menu-toggle');
        if (!sidebarWrapper || !menuToggle) return;
        // Menu toggle open/close
        if (e.target.closest('.menu-toggle')) {
            e.preventDefault();
            sidebarWrapper.classList.toggle('active');
            menuToggle.classList.toggle('active');
            _toggleMenuIcon();
            return;
        }
        // Sidebar nav link close
        if (e.target.closest('#sidebar-wrapper .js-scroll-trigger')) {
            sidebarWrapper.classList.remove('active');
            menuToggle.classList.remove('active');
            _toggleMenuIcon();
            return;
        }
        // Click outside closes sidebar
        if (
            sidebarWrapper.classList.contains('active') &&
            !sidebarWrapper.contains(e.target) &&
            !menuToggle.contains(e.target)
        ) {
            sidebarWrapper.classList.remove('active');
            menuToggle.classList.remove('active');
            _toggleMenuIcon();
        }
    };
    document.addEventListener('click', sidebarMenuHandler, true);

    // Reset sidebar and menu toggle state on page load
    const sidebarWrapper = document.getElementById('sidebar-wrapper');
    if (sidebarWrapper) sidebarWrapper.classList.remove('active');
    const menuToggle = document.body.querySelector('.menu-toggle');
    if (menuToggle) menuToggle.classList.remove('active');

    // Robust scroll-to-top button handler
    let scrollToTopVisible = false;
    sidebarScrollHandler = function() {
        const scrollToTop = document.body.querySelector('.scroll-to-top');
        if (!scrollToTop) return;
        if (document.documentElement.scrollTop > 100) {
            if (!scrollToTopVisible) {
                fadeIn(scrollToTop);
                scrollToTopVisible = true;
            }
        } else {
            if (scrollToTopVisible) {
                fadeOut(scrollToTop);
                scrollToTopVisible = false;
            }
        }
    };
    document.addEventListener('scroll', sidebarScrollHandler);

    function _toggleMenuIcon() {
        const menuToggleBars = document.body.querySelector('.menu-toggle > .fa-bars');
        const menuToggleTimes = document.body.querySelector('.menu-toggle > .fa-xmark');
        if (menuToggleBars) {
            menuToggleBars.classList.remove('fa-bars');
            menuToggleBars.classList.add('fa-xmark');
        }
        if (menuToggleTimes) {
            menuToggleTimes.classList.remove('fa-xmark');
            menuToggleTimes.classList.add('fa-bars');
        }
    }
}

window.addEventListener('DOMContentLoaded', initSidebarMenu);
document.addEventListener('turbo:load', initSidebarMenu);

function fadeOut(el) {
    if (!el) return;
    el.style.opacity = 1;
    (function fade() {
        if ((el.style.opacity -= .1) < 0) {
            el.style.display = "none";
        } else {
            requestAnimationFrame(fade);
        }
    })();
};

function fadeIn(el, display) {
    if (!el) return;
    el.style.opacity = 0;
    el.style.display = display || "block";
    (function fade() {
        var val = parseFloat(el.style.opacity);
        if (!((val += .1) > 1)) {
            el.style.opacity = val;
            requestAnimationFrame(fade);
        }
    })();
};
