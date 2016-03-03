class ToolButton extends SimpleModule

  @pluginName: 'ToolButton'

  opts:
    toolButton: false

  _tpl:
    button: '<a href="javascript:;" class="toolbar-item toolbar-button"></a>'

  _init: () ->
    @editor = @_module
    return unless @opts.toolButton

    @wrapper = @editor.wrapper.find('.simditor-toolbar').find('>ul')

    ###
      {
          name: 'paste',
          title: '粘贴',
          tpl: '<b>粘贴</b>',
          onClick: function(){}
      }    
    ###
    for btn in @opts.toolButton
      @el = $(@_tpl.button)
      @el.attr('title', btn.title)
      .addClass("toolbar-button-" + btn.name)
      .data('button', @)

      if btn.onClick
        @el.on 'click', (e) => 
          btn.onClick.call(@, @editor, e)

      $(btn.tpl).appendTo(@el)
      @el.appendTo(@wrapper)

Simditor.connect ToolButton