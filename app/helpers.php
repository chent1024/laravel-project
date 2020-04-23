<?php
/**
 * 记录日志信息
 * 统一日志格式
 *
 * @param string $tag
 * @param string $info
 * @param array $param
 * @param bool $echo
 */
function log_info(string $tag, string $info, array $param = [], bool $echo = false)
{
    $msg = "[{$tag}] {$info},";
    if ($echo) {
        echo $msg . json_encode($param);
    }
    return info($msg, $param);
}

/**
 * 返回json数据
 *
 * @param array $jsonArr
 * @param Object $cookie
 * @param bool $encode
 * @return json
 */
function json_return($jsonArr, $cookie = NULL, $encode = false)
{
    $json = [
        'status' => $jsonArr['status'] ?? 1,
        'info' => $jsonArr['info'] ?? 'ok',
        'data' => $jsonArr['data'] ?? [],
    ];
    if (!empty($jsonArr['root'])) {
        $json = array_merge($json, $jsonArr['root']);
    }

    if ($encode) {
        $json['data'] = des_encrypt($json['data']);
    }

    $response = Response::json($json);
    if ($cookie) {
        $response = $response->withCookie($cookie);
    }
    return $response;
}

/**
 * 返回json错误信息
 *
 * @param $code int
 * @param string $msg
 * @return json
 */
function json_error($code, $msg = '')
{
    $err = [
        40320 => '请先登录',
        403 => '无权限',
        404 => '未找到数据',
        406 => '参数错误',
        500 => '服务错误，请重试~',
    ];

    if ($msg) {
        $error = $msg;
    } elseif (isset($err[$code])) {
        $error = $err[$code];
    } else {
        $error = '未知错误';
    }

    return json_return(['status' => 0, 'info' => $error, 'data' => []]);
}

/**
 * 加密数据
 *
 * @param $data
 * @return string
 */
function des_encrypt($data)
{
    if (!is_array($data)) {
        $data = [$data];
    }

    $str = json_encode($data);
    $secret = env('DES_SECRET_KEY', '123456789123456789123456');
    $iv = env('DES_SECRET_IV', '01234567');
    $encode = openssl_encrypt($str, 'DES-EDE3-CBC', $secret, 0, $iv);
    return $encode;
}

/**
 * 解密数据
 *
 * @param string $str
 * @return array
 */
function des_decrypt($str)
{
    $secret = env('DES_SECRET_KEY', '123456789123456789123456');
    $iv = env('DES_SECRET_IV', '01234567');
    $data = openssl_decrypt(trim($str), 'DES-EDE3-CBC', $secret, 0, $iv);
    $decode = json_decode($data, true);

    return $decode;
}


/**
 * 订单号
 *
 * @param string $prefix
 * @param string $suffix
 * @return string
 */
function order_num($prefix = '', $suffix = '')
{
    date_default_timezone_set("Asia/Shanghai");
    return $prefix . date('YmdHis') . rand(100000, 999999) . $suffix;
}


/**
 * 格式化金额
 *
 * @param $money
 * @return float
 */
function format_money($money)
{
    return (float)sprintf("%.2f", $money);
}


/**
 * Sub string
 *
 * @param string $str
 * @param number $start
 * @param number $length
 * @param string $charset
 * @param boolen $suffix
 * @return string
 */
function msubstr($str, $start = 0, $length, $charset = "utf-8", $suffix = '...')
{
    if (function_exists("mb_substr")) {
        $result = mb_substr($str, $start, $length, $charset);
    } else if (function_exists('iconv_substr')) {
        $result = iconv_substr($str, $start, $length, $charset);
        if (false === $result) {
            $result = '';
        }
    } else {
        $regExp['utf-8'] = "/[\x01-\x7f]|[\xc2-\xdf][\x80-\xbf]|[\xe0-\xef][\x80-\xbf]{2}|[\xf0-\xff][\x80-\xbf]{3}/";
        $regExp['gb2312'] = "/[\x01-\x7f]|[\xb0-\xf7][\xa0-\xfe]/";
        $regExp['gbk'] = "/[\x01-\x7f]|[\x81-\xfe][\x40-\xfe]/";
        $regExp['big5'] = "/[\x01-\x7f]|[\x81-\xfe]([\x40-\x7e]|\xa1-\xfe])/";
        $match = array();
        preg_match_all($regExp[$charset], $str, $match);
        $result = join("", array_slice($match[0], $start, $length));
    }

    return $suffix && strlen($result) && $result != $str ? $result . $suffix : $result;
}


