<?php
namespace App\Models\Traits;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Pagination\LengthAwarePaginator;
use \Illuminate\Pagination\Paginator;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Request;

/**
 * PaginateTrait
 *
 * class News extends Model{
 *      use PaginateTrait;
 * }
 * Model::jsonPaginate(20);
 *
 * @method LengthAwarePaginator jsonPage(int $perPage = null)
 */
trait PaginateTrait
{

    public function scopeJsonPaginate(Builder $query, $perPage = 10){
        $currentPage = Request::input('page', 1);
        $currentPage = intval($currentPage);
        $total = $this->getTotal($query);
        $totalPage = $total == 0 ? 0 : (int)ceil($total / $perPage);
        $items = $this->getItems($query, $currentPage, $perPage);
        return [
            'data'=>$items,
//            'total'=>$total,
            'cur_page' => $currentPage,
            'total_page'=>$totalPage,
        ];
    }

    /**
     * @param static|$this|Builder $query
     * @param int|null $perPage
     *
     * @return LengthAwarePaginator
     */
    public function scopeJsonPage(Builder $query, $perPage = null)
    {
        $perPage = $perPage ?: $query->getModel()->getPerPage();
        $currentPage = Request::input('page', 1);

        // Total number of records in query
        $total = $this->getTotal($query);

        // Items for current page
        $items = $this->getItems($query, $currentPage, $perPage);

        $result = (new LengthAwarePaginator(
            $items,
            $total,
            $perPage,
            $currentPage
        ))->withPath(Paginator::resolveCurrentPath());
        return $result;
    }

    /**
     * Get the total number of records in the query.
     *
     * @param Builder $query
     *
     * @return int
     */
    protected function getTotal(Builder $query)
    {
        return $query->count();
    }

    /**
     * Get the items for the current page.
     *
     * @param Builder $query
     * @param int $currentPage
     * @param int $perPage
     *
     * @return array
     */
    protected function getItems(Builder $query, $currentPage, $perPage)
    {
        $offSet = ($currentPage * $perPage) - $perPage;

        return $query
            ->offset($offSet)
            ->limit($perPage)
            ->get()
            ->toArray();
    }
}
