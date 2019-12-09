module main

import (
	range
	typef
)

struct Function {
	f string
	typef int
	var string	// variable
mut:
	arr []int	// built from typef
	r []int		// range
	res []int	// results
}
pub fn initialize_function(func string, t int, A int, B int) Function {
	rng := range.initialize_range(A, B)
	mut function := Function{f:func, typef: t, r: rng.get_range(), var: 'x'}
	function.init_arr()
	return function
}

pub fn (func Function) print() string {
	return '{function:$func.f, interval: $func.r, variables: $func.var}'
}

pub fn (func Function) print_results() {
	println(func.print())
	println(func.res.str())
}

pub fn (func mut Function) init_arr() {
	func.arr = typef.get_type(func.typef)
	//println(func.arr)
}

pub fn (func mut Function) set_arr(A int, B int) {
	if func.typef == 0 {
		func.arr[0] = A
		func.arr[1] = B
	}
	else {
		println('still owrking on her')
	}
}

pub fn (func mut Function) set_results(res []int ) {
	func.res = res
}

pub fn (func mut Function) do_work() {
	expression := func.f
	//expansion := func.expand(expression)
	results := func.tokenzr(expression)
	func.set_results(results)
}

pub fn (func Function) expand() []int {
	mut res_eval := []int
	a_int := func.arr[0]
	b_int := func.arr[1]
	for i := func.r[1]; i > func.r[0]; i-- {
		res_eval << evaluate(a_int, i, b_int)
	}
	return res_eval.reverse()
}

pub fn (func mut Function) tokenzr(expr string) []int {
	mut res_eval := []int
	mut a_int := 0
	mut b_int := 0
	splt := expr.split(' ')

	for s in splt {
		if s.ends_with('x') {
			//x_index := s.len - 1
			//a_index := x_index - 1

			//println(x_index)
			//println(a_index)

			a_val := s.trim('x')
			a_int = a_val.int()
			//println(a_val)
			//println(a_int)
		}

		else if s.contains('+') {
			continue
		}
		else {
			b_val := s
			b_int = b_val.int()
			//println(b_int)
		}
	}
	//println(splt)
	func.set_arr(a_int, b_int)
	res_eval = func.expand()
	return res_eval
}

fn evaluate(a int, x int, b int) int {
	return a * x + b
}



pub fn main() {
	//println('test...')
	mut f_test := initialize_function('25x + 5', 0, -10, 10)
	f_test.do_work()
	//f_test.set_results(results)

	f_test.print_results()
}

