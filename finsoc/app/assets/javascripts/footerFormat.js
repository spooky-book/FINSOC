var Footer = {
    formatPage: function() {
        var footer = document.getElementById("footer");
        var footerStyle = window.getComputedStyle(footer);
        var height = "-" + footerStyle.height.toString();
        footer.style.bottom = height;
        console.log(footerStyle.height.toString()); 
    }
};

(function() {
    window.onload = Footer.formatPage;
    window.onresize = Footer.formatPage;

    $("#footer").ready(function() {
        Footer.formatPage();
    });
})(Footer);
