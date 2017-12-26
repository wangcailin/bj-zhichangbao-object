define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'portal/post/index',
                    add_url: 'portal/post/add',
                    edit_url: 'portal/post/edit',
                    del_url: 'portal/post/del',
                    multi_url: 'portal/post/multi',
                    table: 'portal_post',
                }
            });

            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'id',
                sortName: 'id',
                columns: [
                    [
                        {checkbox: true},
                        {field: 'id', title: __('Id')},
                        {field: 'user_id', title: __('User_id')},
                        {field: 'title', title: __('Title')},
                        {field: 'keywords', title: __('Keywords')},
                        {field: 'description', title: __('Description')},
                        {field: 'images', title: __('Images'), formatter: Table.api.formatter.images},
                        {field: 'hits', title: __('Hits')},
                        {field: 'like', title: __('Like')},
                        {field: 'comment', title: __('Comment')},
                        {field: 'create_time', title: __('Create_time'), formatter: Table.api.formatter.datetime},
                        {field: 'published_time', title: __('Published_time'), formatter: Table.api.formatter.datetime},
                        {field: 'is_reply', title: __('Is_reply')},
                        {field: 'operate', title: __('Operate'), table: table, events: Table.api.events.operate, formatter: Table.api.formatter.operate}
                    ]
                ]
            });

            // 为表格绑定事件
            Table.api.bindevent(table);
        },
        add: function () {
            Controller.api.bindevent();
        },
        edit: function () {
            Controller.api.bindevent();
        },
        api: {
            bindevent: function () {
                Form.api.bindevent($("form[role=form]"));
            }
        }
    };
    return Controller;
});