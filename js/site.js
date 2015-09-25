(function() {

    function toggleSidebarItem(item) {
        if (item.className.indexOf('expanded') > -1) {
            item.className = item.className.replace('expanded', 'collapsed');
        } else {
            item.className = item.className.replace('collapsed', 'expanded');
        }
    }

    document.addEventListener('DOMContentLoaded', function() {
        var sidebarEl = document.getElementById('sidebar');
        sidebarEl.onclick = function(e) {
            if (e.target.className.indexOf('sidebar-item-hdr') > -1) {
                toggleSidebarItem(e.target.parentNode);
            }
        }
    });
})();
