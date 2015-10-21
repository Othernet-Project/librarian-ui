## Conditionally render placeholder
##

<%def name="pholder_attr(text=None)">${' placeholder="{}"'.format(text) if text else ''}</%def>

## Select list option
##

<%def name="option(value, label, selected=False)">
    <option value="${value}"${ ' selected' if selected else ''}>${label}</option>
</%def>

## Select list
##

<%def name="select(name, choices=[], empty_value=None, value=None, id=None)">
    <%
        choices = choices or context.get(name + '_choices', [])
        # Make a copy to work around caching issues
        choices = [c for c in choices]
        if empty_value:
            choices.insert(0, ('', empty_value))
        current_value = value or request.params.get(name, '')
    %>
    <select name="${name}" id="${id or name}">
    % for val, label in choices:
        <% selected = val == current_value %>
        ${option(val, label, selected)}
    % endfor
    </select>
</%def>


## Generic input
##

<%def name="input(name, type='text', placeholder=None, value=None, id=None, has_error=False)">
    <% current_value = value or request.params.get(name, '') %>
    <input type="${type}" name="${name}" id="${id or name}" value="${current_value}"${self.pholder_attr(placeholder)}>
</%def>

## Hidden input
## 

<%def name="hidden(name, value, id=None)">
    ${self.input(name, value=value, id=id or name)}
</%def>

## Text input
##

<%def name="text(name, placeholder=None, value=None, id=None)">
    ${self.input(name, 'text', placeholder=placeholder, value=value, id=id)}
</%def>

## Checkbox
##

<%def name="checkbox(name, value, is_checked=None, label=None, id=None)">
    <% 
    current_value = request.params.getall(name) 
    is_checked = value in current_value if is_checked is None else is_checked
    %>
    <input type="checkbox" id="${id or name}" name="${name}" value="${value}"${' checked' if is_checked else ''}>
    % if label:
        ${self.label(label, inline=True)}
    % endif
</%def>

## Textarea
##

<%def name="textarea(name, placeholder=None, value=None, id=None)">
    <% 
    current_value = value or request.params.getall(name)
    %>
    <textarea name="${name}" id="${id or name}"${self.pholder_attr(placeholder)}>${current_value}</textarea>
</%def>


## Label
##

<%def name="label(label, inline=False, id=None)">
    <label${' for="{}"'.format(id) if id else ''} class="o-field-label${' o-field-label-inline' if inline else ''}">${label}</label>
</%def>

## Field supplemental information
##

<%def name="field_help(message)">
    <span class="o-field-help-message">
        ${message}
    </span>
</%def>

<%def name="field_error(message)">
    <span class="o-field-error-message">
        ${message}
    </span>
</%def>

<%def name="field_extras(fld)">
    % if fld.options.get('help_text'):
        ${self.field_help(fld.options.get('help_text'))}
    % endif
    % if fld.error:
        ${self.field_error(fld.error)}
    % endif
</%def>

## Field
##
## This def renders a bottle-utils Field instance.
## 

<%def name="field(fld, id=None)">
    <p class="o-field${' o-field-error' if fld.error else ''}">
        ## Label
        % if fld.type not in ('checkbox', 'radio'):
            ${self.label(fld.label, id=id or fld.name)}
        % endif

        ## Help text for textarea is rendered above the field but below label
        % if fld.type in ('textarea',):
            ${self.field_extras(fld)}
        % endif

        ## Field
        % if fld.type in ['text', 'email', 'date', 'password', 'file']:
            ${self.input(fld.name, type=fld.type, placeholder=fld.options.get('placeholder'), value=fld.value, id=id)}
        % elif fld.type == 'hidden':
            ${self.hidden(fld.name, value=fld.value, id=id)}
        % elif fld.type in ['checkbox', 'radio']:
            ${self.checkbox(fld.name, value=fld.expected_value, is_checked=fld.value, id=id)}
        % elif fld.type == 'textarea':
            ${self.textarea(fld.name, placeholder=fld.options.get('placeholder'), value=fld.value, id=id)}
        % elif fld.type == 'select':
            ${self.select(fld.name, fld.choices, value=fld.value, id=id)}
        % endif

        ## Help text for non-textarea fields is rendered below the field
        % if fld.type not in ('textarea',):
            ${self.field_extras(fld)}
        % endif
    </p>
</%def>

## Form errors and messages
##

<%def name="form_errors(errors)">
    <% 
    if not errors:
        return '' 
    %>
    <ul class="o-form-errors">
        % for error in errors:
            <li class="o-form-error">
            ${error}
            </li>
        % endfor
    </ul>
</%def>

<%def name="form_message(message)">
    <% 
    if not message:
        return ''
    %>
    <p class="o-form-message">
        ${message}
    </p>
</%def>
