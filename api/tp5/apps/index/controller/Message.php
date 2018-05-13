<?php
namespace app\index\controller;

class Message extends Common {
	public function send() {
		$data = $this->params;
		switch ($data['type']) {
		case 'goods':
			$db_name = 'lmsg';
			break;
		case 'dynamic':
			$db_name = 'dmsg';
			break;
		}
		$params[$db_name . '_sid'] = $this->login_uid();
		$params[$db_name . '_gid'] = $data['id'];
		$params[$db_name . '_content'] = $data['content'];
		$params[$db_name . '_time'] = time();
		$params[$db_name . '_lid'] = $data['lid'];
		$params[$db_name . '_rid'] = $data['rid'];
		$res = db($db_name . '')->insertGetId($params);
		if (!$res) {
			$this->return_msg(400, '留言失败');
		} else {
			if ($params[$db_name . '_lid'] !== 0) {
				db($db_name)->where($db_name . '_id', $params[$db_name . '_lid'])->setField($db_name . '_status', 2);
			}
			// 增加留言+2
			$this->add_pop($params[$db_name . '_sid'], 2);
			$this->return_msg(200, '留言成功', $params);
		}
	}
	public function get() {
		$data = $this->params;
		switch ($data['type']) {
		case 'goods':
			$db_name = 'lmsg';
			break;
		case 'dynamic':
			$db_name = 'dmsg';
		}
		$params[$db_name . '_rid'] = $this->login_uid();
		$params[$db_name . '_status'] = $data['status'];
		$res = $this->get_msg_by_user($params, $data['type']);
		$total = db($db_name)->where($params)->count();
		if ($res === false) {
			$this->return_msg(400, '查询消息失败');
		} else {
			$this->return_msg(200, '查询消息成功', $res, $total);
		}
	}
	public function get_count() {
		$data = $this->params;
		$uid = $this->login_uid();
		$l_count = db('lmsg')->where('lmsg_rid', $uid)->where('lmsg_status', 0)->count();
		$d_count = db('dmsg')->where('dmsg_rid', $uid)->where('dmsg_status', 0)->count();
		$this->return_msg(200, '查询消息数目成功', $l_count + $d_count);
	}
	public function get_by_id() {
		$data = $this->params;
		$res = $this->get_msg($data['gid'], $data['type']);
		if ($res === false) {
			$this->return_msg(400, '查询消息失败');
		} else {
			$this->return_msg(200, '查询消息成功', $res, count($res));
		}
	}
	public function get_msg_by_user($params, $type) {
		if ($type === 'goods') {
			$join = [['erhuo_user s', 's.user_id = l.lmsg_sid'], ['erhuo_user r', 'r.user_id = l.lmsg_rid'], ['erhuo_goods g', 'g.goods_id = l.lmsg_gid']];
			$field = 'lmsg_id, lmsg_lid, lmsg_gid, lmsg_content, lmsg_status, lmsg_time, r.user_id as ruser_id,r.user_icon as ruser_icon,r.user_name as ruser_name,s.user_id as suser_id, s.user_name as suser_name, s.user_icon as suser_icon, g.goods_id as goods_id, g.goods_name as goods_name';
			$res = db('lmsg')->alias('l')->join($join)->field($field)->where($params)->order('lmsg_time desc')->select();
			$res = $this->arrange_data($res, 'goods');
		} else if ($type === 'dynamic') {
			$join = [['erhuo_user s', 's.user_id = d.dmsg_sid'], ['erhuo_user r', 'r.user_id = d.dmsg_rid'], ['erhuo_dynamic dy', 'dy.dynamic_id = d.dmsg_gid']];
			$field = 'dmsg_id, dmsg_lid, dmsg_gid, dmsg_content, dmsg_status, dmsg_time, r.user_id as ruser_id,r.user_icon as ruser_icon,r.user_name as ruser_name,s.user_id as suser_id, s.user_name as suser_name, s.user_icon as suser_icon';
			$res = db('dmsg')->alias('d')->join($join)->field($field)->where($params)->order('dmsg_time desc')->select();
			foreach ($res as $key => $value) {
				if ($res[$key]['dmsg_lid'] == 0) {
					$res[$key]['father'] = db('dynamic')->where('dynamic_id', $res[$key]['dmsg_gid'])->field('dynamic_content')->find()['dynamic_content'];
				} else {
					$res[$key]['father'] = db('dmsg')->where('dmsg_id', $res[$key]['dmsg_lid'])->field('dmsg_content')->find()['dmsg_content'];
				}
			}
		}
		$res = $this->arrange_data($res, 'ruser');
		$res = $this->arrange_data($res, 'suser');
		return $res;
	}
	public function change_status() {
		$data = $this->params;
		switch ($data['type']) {
		case 'goods':
			$db_name = 'lmsg';
			break;
		case 'dynamic':
			$db_name = 'dmsg';
		}
		$params[$db_name . '_rid'] = $this->login_uid();
		$params[$db_name . '_id'] = $data[$db_name . '_id'];
		$res = db($db_name)->where($params)->setField($db_name . '_status', $data['status']);
		if (!$res) {
			$this->return_msg(400, '更改消息状态失败');
		} else {
			$this->return_msg(200, '更改消息状态成功', $res);
		}
	}
	public function delete() {
		$data = $this->params;
		switch ($data['type']) {
		case 'goods':
			$db_name = 'lmsg';
			break;
		case 'dynamic':
			$db_name = 'dmsg';
		}
		$params[$db_name . '_rid'] = $this->login_uid();
		$params[$db_name . '_id'] = $data['id'];
		$res = db($db_name)->where($params)->delete();
		if (!$res) {
			$this->return_msg(400, '删除消息失败');
		} else {
			$this->return_msg(200, '删除消息成功', $res);
		}
	}
	public function get_notice() {
		$data = $this->params;
		$uid = $this->login_uid();
		$join = [['erhuo_user u', 'u.user_id = n.notice_uid']];
		$field = 'notice_id, notice_title, notice_content, notice_time, user_id, user_name, user_icon';
		$db = db('notice')->alias('n')->join($join)->field($field)->order('notice_time desc');
		if (isset($data['last_time'])) {
			$last_time = db('user')->where('user_id', $uid)->field('user_lntime')->find()['user_lntime'];
			$res = db('notice')->alias('n')->join($join)->field($field)->order('notice_time desc')->where('notice_lid = 0 OR notice_lid =' . $uid)->where('notice_time > ' . $last_time)->select();
		} else {
			$res = $db->where('notice_lid', 0)->whereOr('notice_lid', $uid)->select();
		}
		if ($res === false) {
			$this->return_msg(400, '获得公告失败');
		} else {
			foreach ($res as $key => $value) {
				$res[$key]['notice_content'] = htmlspecialchars_decode($value['notice_content']);
			}
			$res = $this->arrange_data($res, 'user');
			db('user')->where('user_id', $uid)->setField('user_lntime', time());
			$this->return_msg(200, '获得公告成功', $res);
		}
	}
	public function praise() {
		$data = $this->params;
		$uid = $this->login_uid();
		$params['praise_type'] = $data['type'];
		$params['praise_mid'] = $data['mid'];
		$params['praise_uid'] = $uid;
		$is_praised = db('praise')->where($params)->find();
		if ($is_praised) {
			$res = db('praise')->where('praise_id', $is_praised['praise_id'])->delete();
			$msg = '取消点赞';
			$this->add_pop($uid, -2);
		} else {
			$params['praise_time'] = time();
			$res = db('praise')->insert($params);
			$msg = '点赞成功';
			$this->add_pop($uid, 2);
		}
		if (!$res) {
			$this->return_msg(400, '点赞失败');
		} else {
			$this->return_msg(200, $msg, $res);
		}
	}
	public function get_fmsg() {
		$uid = $this->login_uid();
		$join = [['erhuo_user u', 'u.user_id = f.fmsg_uid']];
		$field = 'user_id, user_name, user_icon, fmsg_id, fmsg_content, fmsg_status, fmsg_time';
		if (isset($data['fmsg_status'])) {
			$res = db('fmsg')->alias('f')->join($join)->field($field)->where('fmsg_uid', $uid)->where('fmsg_status', $data['fmsg_status'])->order('fmsg_time desc')->select();
		} else {
			$res = db('fmsg')->alias('f')->join($join)->field($field)->where('fmsg_uid', $uid)->order('fmsg_time desc')->select();
		}
		if ($res !== false) {
			$res = $this->arrange_data($res, 'user');
			$total = count($res);
			$this->return_msg(200, '获取反馈信息成功', $res, $total);
		} else {
			$this->return_msg(400, '获取反馈信息失败');
		}
	}
	public function del_fmsg() {
		$uid = $this->login_uid();
		$data = $this->params;
		$res = db('fmsg')->where('fmsg_id', $data['fmsg_id'])->where('fmsg_uid', $uid)->delete();
		if (!$res) {
			$this->return_msg(400, '删除反馈信息失败');
		} else {
			$this->return_msg(200, '删除反馈信息成功');
		}
	}
}