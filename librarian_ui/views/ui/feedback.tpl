<%inherit file="/narrow_base.tpl"/>

<%block name="title">
${page_title}
</%block>

<%block name="narrow_main">
<div class="feedback ${status}">
    <span class="icon"></span>
    <p class="main">${message}</p>
    <% link = '<a href="{url}">{target}</a>'.format(url=redirect_url, target=redirect_target) %>
    <p class="sub">${_("You'll be taken to {target} in {seconds} seconds.").format(seconds=REDIRECT_DELAY, target=link)}</p>
</div>
</%block>
