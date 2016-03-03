simditor-toolbutton
=================

[Simditor](http://simditor.tower.im/) 扩展，在工具栏增加自定义按钮。

### 如何使用

在 Simditor 的基础上额外引用 simditor-toolbutton 的脚本。

```html
<script src="/assets/javascripts/simditor-toolbutton.js"></script>
```

**配置**

在 Simditor 初始化时，直接写入配置信息中，其中onClick执行上下文为`当前按钮`
```javascript
    new Simditor({
        textarea: textareaElement,
        ...
        toolButton: [{
            name: 'paste',
            title: '粘贴',
            tpl: '<b>粘贴</b>',
            onClick: function(J_editor, e) {}
        }]
    })
```
