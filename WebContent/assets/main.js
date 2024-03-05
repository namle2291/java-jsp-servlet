const header = document.querySelector('header');
const btn_back_to_top = document.querySelector('.back_to_top');
const search_form = document.querySelector('.search_form');

function scrollHeader() {
    window.addEventListener('scroll', (e) => {
        // Header
        if (window.scrollY > 32) {
           Object.assign(header.style, {
                top: '0px',
           });
        } else {
            Object.assign(header.style, {
                top: '32px',
           });
        }
        // Show btn back to top
        if (window.scrollY > 200) {
            btn_back_to_top.style.bottom = '5px';
        } else {
            btn_back_to_top.style.bottom = '-40px';
        }

    })
}

function backToTop() {
    btn_back_to_top.onclick = () => {
        document.documentElement.scrollTop = 0;
    }
}

scrollHeader();
backToTop();

console.log(123);

