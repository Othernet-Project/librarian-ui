## Select list option
##

<%def name="option(value, label, selected=False)">
    <option value="${value}"${ ' selected' if selected else ''}>${label}</option>
</%def>

## Select list
##

<%def name="select(name)">
    <% 
    choices = context.get(name + '_choices', [])
    current_value = request.params.get(name, '')
    %>
    <select name="${name}" id="${name}">
    % for value, label in choices:
        <% selected = value == current_value %>
        ${option(value, label, selected)}
    % endfor
    </select>
</%def>

## Text input
##

<%def name="text(name, placeholder=None)">
    <% current_value = request.params.get(name, '') %>
    <input type="text" name="${name}" id="${name}" value="${current_value}"${ ' placeholder="{}"'.format(placeholder) if placeholder else ''}>
</%def>
