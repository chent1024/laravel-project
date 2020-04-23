<?php

namespace App\Admin\Models;

use Illuminate\Database\Eloquent\Model;
use Encore\Admin\Traits\ModelTree;
use Encore\Admin\Traits\AdminBuilder;


class Category extends Model
{
    use ModelTree, AdminBuilder;
    protected $table = 'category';

    public function __construct(array $attributes = [])
    {
        parent::__construct($attributes);

        $this->setParentColumn('pid');
        $this->setOrderColumn('sort_by');
        $this->setTitleColumn('name');
    }
}
