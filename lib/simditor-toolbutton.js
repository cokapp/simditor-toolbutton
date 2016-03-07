(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    // AMD. Register as an anonymous module unless amdModuleId is set
    define('simditor-toolbutton', ["jquery","simple-module","simditor"], function (a0,b1,c2) {
      return (root['ToolButton'] = factory(a0,b1,c2));
    });
  } else if (typeof exports === 'object') {
    // Node. Does not work with strict CommonJS, but
    // only CommonJS-like environments that support module.exports,
    // like Node.
    module.exports = factory(require("jquery"),require("simple-module"),require("simditor"));
  } else {
    root['ToolButton'] = factory(jQuery,SimpleModule,Simditor);
  }
}(this, function ($, SimpleModule, Simditor) {

var ToolButton,
  extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
  hasProp = {}.hasOwnProperty;

ToolButton = (function(superClass) {
  extend(ToolButton, superClass);

  function ToolButton() {
    return ToolButton.__super__.constructor.apply(this, arguments);
  }

  ToolButton.pluginName = 'ToolButton';

  ToolButton.prototype.opts = {
    toolButton: false
  };

  ToolButton.prototype._tpl = {
    button: '<a href="javascript:;" class="toolbar-item toolbar-button"></a>'
  };

  ToolButton.prototype._init = function() {
    var btn, i, len, ref, results;
    this.editor = this._module;
    if (!this.opts.toolButton) {
      return;
    }
    this.wrapper = this.editor.wrapper.find('.simditor-toolbar').find('>ul');

    /*
      {
          name: 'paste',
          title: '粘贴',
          tpl: '<b>粘贴</b>',
          onClick: function(){}
      }
     */
    ref = this.opts.toolButton;
    results = [];
    for (i = 0, len = ref.length; i < len; i++) {
      btn = ref[i];
      this.el = $(this._tpl.button);
      this.el.attr('title', btn.title).addClass("toolbar-button-" + btn.name).data('button', this);
      if (btn.onClick) {
        this.el.on('click', (function(_this) {
          return function(e) {
            return btn.onClick.call(_this, _this.editor, e);
          };
        })(this));
      }
      $(btn.tpl).appendTo(this.el);
      results.push(this.el.appendTo(this.wrapper));
    }
    return results;
  };

  return ToolButton;

})(SimpleModule);

Simditor.connect(ToolButton);

return ToolButton;

}));
