<?php
namespace app\index\controller;
use think\db;

class Admin extends Common {
	public function get_fmsg() {
		$data = $this->params;
		// $this->check_admin();
		$join = [['erhuo_user u', 'u.user_id = f.fmsg_uid']];
		$field = 'user_id, user_name, user_icon, fmsg_id, fmsg_content, fmsg_status, fmsg_time';
		if (isset($data['fmsg_status'])) {
			$res = db('fmsg')->alias('f')->join($join)->field($field)->where('fmsg_status', $data['fmsg_status'])->select();
		} else {
			$res = db('fmsg')->alias('f')->join($join)->field($field)->select();
		}
		if ($res !== false) {
			$res = $this->arrange_data($res, 'user');
			$res['length'] = count($res);
			$this->return_msg(200, '获取反馈信息成功', $res);
		} else {
			$this->return_msg(400, '获取反馈信息失败');
		}
	}
	public function edit_fmsg() {
		$data = $this->params;
		$res = db('fmsg')->where('fmsg_id', $data['fmsg_id'])
			->update($data);
		if ($res) {
			$this->return_msg(200, '修改反馈信息成功', $res);
		} else {
			$this->return_msg(400, '修改反馈信息失败');
		}
	}
	public function pass_goods() {
		$data = $this->params;
		$res = db('goods')->where('goods_id', $data['goods_id'])->setField('goods_status', $data['goods_status']);
		if ($res !== false) {
			$this->return_msg(200, '审核商品成功', intval($data['goods_status']));
		} else {
			$this->return_msg(400, '审核商品失败');
		}
	}
	public function spread_goods() {
		$data = $this->params;
		$res = db('goods')->where('goods_id', $data['goods_id'])->setField('goods_spread', $data['goods_spread']);
		if ($res !== false) {
			$this->return_msg(200, '推广商品成功', intval($data['goods_spread']));
		} else {
			$this->return_msg(400, '推广商品失败');
		}
	}
	public function send_notice() {
		$data = $this->params;
		//$uid = $this->login_uid();
		$data['notice_uid'] = 1;
		if (!isset($data['notice_time'])) {
			$data['notice_time'] = time();
		}
		$res = db('notice')->insertGetId($data);
		if ($res) {
			$this->return_msg(200, '发送公告成功', $res);
		} else {
			$this->return_msg(400, '发送公告失败');
		}
	}
	public function get_report(){
		$data = $this->params;
		if (!isset($data['page'])) {
			$data['page'] = 1;
		}
		if (!isset($data['num'])) {
			$data['num'] = 5;
		}
		$join = [['erhuo_user u', 'u.user_id = r.report_uid']];
		$field = 'report_id, report_type, report_gid, report_reason, report_content, report_time, user_id, user_name, user_icon';
		$_db = db('report')->alias('r')->join($join)->field($field)->page($data['page'], $data['num']);
		if ($data['type'] != 0) {
			$res = $_db->where('report_type', $data['type'])->select();
		    $total = $_db->where('report_type', $data['type'])->count();
		} else {
			$res = $_db->select();
		    $total = $_db->count();
		}
		if ($res) {
			$res = $this->arrange_data($res, 'user');
			foreach ($res as $key => $value) {
				$type = $value['report_type'];
				if ($type === 1) {
					$res[$key]['child'] = $this->get_one_goods($value['report_gid'], 0);
				} else if ($type === 2) {
					$res[$key]['child'] = $this->get_lmsg($value['report_gid'], 0);
				} else if ($type === 3) {
					$res[$key]['child'] = $this->get_one_dynamic($value['report_gid']);
				}
			}
			$this->return_msg(200, '获得举报成功', $res, $total);
		} else {
			$this->return_msg(400, '获得举报失败', $res);
		}
	}
	public function del_report(){
		$data = $this->params;
		$res = db('report')->where('report_id', $data['report_id'])->delete();
		if ($res !== false) {
			$this->return_msg(200, '删除举报成功', $res);
		} else {
			$this->return_msg(400, '删除举报失败');
		}
	}
	public function del_report_item(){
		$data = $this->params;
		$res = false;
		if ($data['type'] == 1) {
			$res = db('goods')->where('goods_id', $data['gid'])->delete();
		} else if ($data['type'] == 2) {
			$res = db('lmsg')->where('lmsg_id', $data['gid'])->delete();
		} else if ($data['type'] == 3) {
			$res = db('dynamic')->where('dynamic_id', $data['gid'])->delete();
		}
		if ($res !== false) {
			db('report')->where('report_gid', $data['gid'])->where('report_type', $data['type'])->delete();
			$this->return_msg(200, '删除成功', $res);
		} else {
			$this->return_msg(400, '删除失败');
		}
	}
	public function on_lock() {
		$data = $this->params;
		$uid = session('user_id');
		$res = db('user')->where('user_id', $uid)->where('user_psd', $data['psd'])->where('user_access', 1)->find();
		if ($res) {
			$this->return_msg(200, '解锁成功成功', $res);
		} else {
			$this->return_msg(400, '解锁成功失败');
		}
	}
}