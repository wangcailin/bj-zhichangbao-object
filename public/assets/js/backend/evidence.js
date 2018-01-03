define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'evidence/index',
                    add_url: 'evidence/add',
                    edit_url: 'evidence/edit',
                    del_url: 'evidence/del',
                    multi_url: 'evidence/multi',
                    table: 'evidence',
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
                        {field: 'company', title: __('Company')},
                        {field: 'company_address', title: __('Company_address')},
                        {field: 'contact', title: __('Contact')},
                        {field: 'contact_phone', title: __('Contact_phone')},
                        {field: 'job_post', title: __('Job_post')},
                        {field: 'job_address', title: __('Job_address')},
                        {field: 'job_time', title: __('Job_time'), formatter: Table.api.formatter.datetime},
                        {field: 'compact', title: __('Compact')},
                        {field: 'rights_type', title: __('Rights_type')},
                        {field: 'rights_money', title: __('Rights_money')},
                        {field: 'email', title: __('Email')},
                        {field: 'job_name', title: __('Job_name')},
                        {field: 'job_age', title: __('Job_age')},
                        {field: 'sex', title: __('Sex')},
                        {field: 'registered', title: __('Registered')},
                        {field: 'reconcile', title: __('Reconcile')},
                        {field: 'status', title: __('Status'), formatter: Table.api.formatter.status},
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