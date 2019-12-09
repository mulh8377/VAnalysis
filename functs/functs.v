module main

import (
	range
)

struct Function {
	f string
mut:
	r []int
	var string
	res []int
}
pub fn initialize_function(func string, A int, B int) Function {
	rng := range.initialize_range(A, B)
	return Function{f:func, r: rng.get_range(), var: 'x'}
}

pub fn (func Function) print() string {
	return '{function:$func.f, interval: $func.r, variables: $func.var}'
}

pub fn (func Function) print_results() {
	println(func.print())
	println(func.res.str())
}

pub fn (func mut Function) set_results(res []int ) {
	func.res = res
}

pub fn (func Function) do_work() []int {
	expression := func.f
	//expansion := func.expand(expression)
	results := func.tokenzr(expression)
	return results
}

pub fn (func Function) expand(expression string) []string {
	mut res := []string
	for i := func.r[0]; i < func.r[1]; i++ {
		res << expression
	} 
	return res
}

pub fn (func Function) tokenzr(expr string) []int {
	mut res_eval := []int
	mut a_int := 0
	mut b_int := 0
	splt := expr.split(' ')

	for s in splt {
		if s.ends_with('x') {
			x_index := s.len - 1
			a_index := x_index - 1

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

	for i := func.r[1]; i > func.r[0]; i-- {
		res_eval << evaluate(a_int, i, b_int)
	} 
	//println(splt)
	return res_eval.reverse()
}

fn evaluate(a int, x int, b int) int {
	return a * x + b
}



pub fn main() {
	//println('test...')
	mut f_test := initialize_function('25x + 5', -10, 10)
	results := f_test.do_work()
	f_test.set_results(results)

	f_test.print_results()
}

