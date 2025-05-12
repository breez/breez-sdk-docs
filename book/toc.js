// Populate the sidebar
//
// This is a script, and not included directly in the page, to control the total size of the book.
// The TOC contains an entry for each page, so if each page includes a copy of the TOC,
// the total size of the page becomes O(n**2).
class MDBookSidebarScrollbox extends HTMLElement {
    constructor() {
        super();
    }
    connectedCallback() {
        this.innerHTML = '<ol class="chapter"><li class="chapter-item affix "><li class="part-title">API Overview</li><li class="chapter-item "><a href="guide/about_breez_sdk_greenlight.html">About the Breez SDK - Greenlight</a></li><li class="chapter-item "><a href="guide/getting_started.html">Getting Started</a><a class="toggle"><div>❱</div></a></li><li><ol class="section"><li class="chapter-item "><a href="guide/install.html">Installing the Breez SDK</a><a class="toggle"><div>❱</div></a></li><li><ol class="section"><li class="chapter-item "><a href="guide/android_troubleshooting.html">Troubleshooting Android</a></li></ol></li><li class="chapter-item "><a href="guide/connecting.html">Connecting to a node</a></li><li class="chapter-item "><a href="guide/node_state.html">Getting the node state</a></li><li class="chapter-item "><a href="guide/logging.html">Adding logging</a></li></ol></li><li class="chapter-item "><a href="guide/payments.html">Paying in Lightning</a><a class="toggle"><div>❱</div></a></li><li><ol class="section"><li class="chapter-item "><a href="guide/receive_payment.html">Receiving payments</a></li><li class="chapter-item "><a href="guide/send_payment.html">Sending payments</a></li><li class="chapter-item "><a href="guide/send_spontaneous_payment.html">Sending spontaneous payments</a></li><li class="chapter-item "><a href="guide/list_payments.html">Listing payments</a></li><li class="chapter-item "><a href="guide/payment_metadata.html">Adding and filtering for payment metadata</a></li></ol></li><li class="chapter-item "><a href="guide/connecting_lsp.html">Connecting to an LSP</a></li><li class="chapter-item "><a href="guide/receive_onchain.html">Receiving an on-chain transaction</a></li><li class="chapter-item "><a href="guide/pay_onchain.html">Sending an on-chain transaction</a></li><li class="chapter-item "><a href="guide/communicating_fees.html">Communicating fees</a></li><li class="chapter-item "><a href="guide/lnurl.html">Using LNURL &amp; Lightning addresses</a><a class="toggle"><div>❱</div></a></li><li><ol class="section"><li class="chapter-item "><a href="guide/lnurl_pay.html">Sending payments using LNURL-Pay/Lightning address</a></li><li class="chapter-item "><a href="guide/lnurl_pay_service.html">Receiving payments using LNURL-Pay/Lightning address</a></li><li class="chapter-item "><a href="guide/lnurl_withdraw.html">Receiving payments using LNURL-Withdraw</a></li><li class="chapter-item "><a href="guide/lnurl_auth.html">Authenticating using LNURL-Auth</a></li></ol></li><li class="chapter-item "><a href="guide/messages.html">Signing and verifying messages</a></li><li class="chapter-item "><a href="guide/fiat_currencies.html">Supporting fiat currencies</a></li><li class="chapter-item "><a href="guide/buy_btc.html">Buying Bitcoin</a></li><li class="chapter-item "><a href="guide/static_channel_backup.html">Exporting channels backup</a></li><li class="chapter-item "><a href="guide/closed_channels.html">Handling channel closures</a></li><li class="chapter-item "><a href="guide/service_status.html">Retrieving service status</a></li><li class="chapter-item "><a href="guide/failure_report.html">Reporting payment failures</a></li><li class="chapter-item "><a href="guide/production.html">Moving to production</a></li><li class="chapter-item affix "><li class="spacer"></li><li class="chapter-item affix "><li class="part-title">Notifications</li><li class="chapter-item "><a href="notifications/getting_started.html">Implementing mobile notifications</a></li><li class="chapter-item "><a href="notifications/setup_nds.html">Setting up an NDS</a></li><li class="chapter-item "><a href="notifications/using_webhooks.html">Using webhooks</a></li><li class="chapter-item "><a href="notifications/setup_plugin.html">Integrating the plugin</a><a class="toggle"><div>❱</div></a></li><li><ol class="section"><li class="chapter-item "><a href="notifications/android_setup.html">Android</a><a class="toggle"><div>❱</div></a></li><li><ol class="section"><li class="chapter-item "><a href="notifications/android_service.html">Setting up the Foreground Service</a></li><li class="chapter-item "><a href="notifications/android_plugin.html">Adding the notification Plugin</a></li></ol></li><li class="chapter-item "><a href="notifications/ios_setup.html">iOS</a><a class="toggle"><div>❱</div></a></li><li><ol class="section"><li class="chapter-item "><a href="notifications/ios_service.html">Setting up the notification service extension</a></li><li class="chapter-item "><a href="notifications/ios_plugin.html">Adding the notification plugin</a></li></ol></li></ol></li><li class="chapter-item "><a href="notifications/advanced.html">Advanced</a><a class="toggle"><div>❱</div></a></li><li><ol class="section"><li class="chapter-item "><a href="notifications/logging.html">Adding logging</a></li><li class="chapter-item "><a href="notifications/service_configuration.html">Configuring the plugin</a></li><li class="chapter-item "><a href="notifications/changing_strings.html">Changing default strings</a></li><li class="chapter-item "><a href="notifications/custom_messages.html">Customising push messages</a></li><li class="chapter-item "><a href="notifications/custom_notifications.html">Handling custom notifications</a></li></ol></li><li class="chapter-item "><a href="guide/payment_notification.html"></a></li></ol>';
        // Set the current, active page, and reveal it if it's hidden
        let current_page = document.location.href.toString().split("#")[0].split("?")[0];
        if (current_page.endsWith("/")) {
            current_page += "index.html";
        }
        var links = Array.prototype.slice.call(this.querySelectorAll("a"));
        var l = links.length;
        for (var i = 0; i < l; ++i) {
            var link = links[i];
            var href = link.getAttribute("href");
            if (href && !href.startsWith("#") && !/^(?:[a-z+]+:)?\/\//.test(href)) {
                link.href = path_to_root + href;
            }
            // The "index" page is supposed to alias the first chapter in the book.
            if (link.href === current_page || (i === 0 && path_to_root === "" && current_page.endsWith("/index.html"))) {
                link.classList.add("active");
                var parent = link.parentElement;
                if (parent && parent.classList.contains("chapter-item")) {
                    parent.classList.add("expanded");
                }
                while (parent) {
                    if (parent.tagName === "LI" && parent.previousElementSibling) {
                        if (parent.previousElementSibling.classList.contains("chapter-item")) {
                            parent.previousElementSibling.classList.add("expanded");
                        }
                    }
                    parent = parent.parentElement;
                }
            }
        }
        // Track and set sidebar scroll position
        this.addEventListener('click', function(e) {
            if (e.target.tagName === 'A') {
                sessionStorage.setItem('sidebar-scroll', this.scrollTop);
            }
        }, { passive: true });
        var sidebarScrollTop = sessionStorage.getItem('sidebar-scroll');
        sessionStorage.removeItem('sidebar-scroll');
        if (sidebarScrollTop) {
            // preserve sidebar scroll position when navigating via links within sidebar
            this.scrollTop = sidebarScrollTop;
        } else {
            // scroll sidebar to current active section when navigating via "next/previous chapter" buttons
            var activeSection = document.querySelector('#sidebar .active');
            if (activeSection) {
                activeSection.scrollIntoView({ block: 'center' });
            }
        }
        // Toggle buttons
        var sidebarAnchorToggles = document.querySelectorAll('#sidebar a.toggle');
        function toggleSection(ev) {
            ev.currentTarget.parentElement.classList.toggle('expanded');
        }
        Array.from(sidebarAnchorToggles).forEach(function (el) {
            el.addEventListener('click', toggleSection);
        });
    }
}
window.customElements.define("mdbook-sidebar-scrollbox", MDBookSidebarScrollbox);
