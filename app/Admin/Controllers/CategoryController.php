<?php

namespace App\Admin\Controllers;

use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use App\Admin\Models\Category;

class CategoryController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '分类管理';

    protected function grid()
    {
        return Category::tree();
    }

    protected function form()
    {
        $form = new Form(new Category());
        $form->display('id', __('ID'));
        $form->select('pid', '父分类')->options(Category::selectOptions());
        $form->text('name', '分类名');
        $form->text('py', '分类标识');
        $form->number('sort_by', '排序')->max(999)->default(999);

        $form->display('created_at', __('Created At'));
        $form->display('updated_at', __('Updated At'));

        return $form;
    }
}
