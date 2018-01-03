define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'evidence/lawyer/index',
                    add_url: 'evidence/lawyer/add',
                    edit_url: 'evidence/lawyer/edit',
                    del_url: 'evidence/lawyer/del',
                    multi_url: 'evidence/lawyer/multi',
                    table: 'evidence_lawyer',
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
                        {field: 'evidence_id', title: __('Evidence_id')},
                        {field: 'lawyer_time', title: __('Lawyer_time'), formatter: Table.api.formatter.datetime},
                        {field: 'express_type', title: __('Express_type')},
                        {field: 'express_code', title: __('Express_code')},
                        {field: 'express_time', title: __('Express_time'), formatter: Table.api.formatter.datetime},
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