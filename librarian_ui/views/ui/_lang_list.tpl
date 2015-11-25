<% path = request.params.get('path', request.path) %>
<ul class="language-list">
    % for locale, lang in languages:
        <% lang_url = i18n_path(path=path, locale=locale) %>
        <li>
        <a href="${i18n_path(path, locale=locale)}">
            ${lang}
            <span class="icon icon-expand-right"></span>
        </a>
        </li>
    % endfor
</ul>
