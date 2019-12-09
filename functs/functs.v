module main

import (
	range
	typef
	tokenf
	computef
)

struct Function {
	f string
	typef int
	var string	// variable
mut:
	arr []int			// built from typef
	domain []int		// x-range
	output []f64		// output from x-range
}
pub fn initialize_function(func string, t int, A int, B int) Function {
	rng := range.initialize_range(A, B)
	mut function := Function{f:func, typef: t, domain: rng.get_range(), var: 'x'}
	function.init_arr()
	return function
}

pub fn (func Function) print() string {
	return '{function:$func.f, interval: $func.domain, variables: $func.var}'
}

pub fn (func Function) print_results() {
	println(func.print())
	println(func.output.str())
}

pub fn (func mut Function) init_arr() {
	func.arr = typef.get_type(func.typef)
	//println(func.arr)
}

pub fn (func mut Function) set_arr(ARR []int) {
	func.arr = ARR
}

pub fn (func mut Function) set_results(output []f64 ) {
	func.output = output
}

pub fn (func Function) expand() []f64 {
	mut res_eval := []f64
	a_int := func.arr[0]
	b_int := func.arr[1]
	for i := func.domain[1]; i > func.domain[0]; i-- {
		res_eval << computef.evaluate_lin(a_int, i, b_int)
	}
	return res_eval.reverse()
}

pub fn (func mut Function) do_work() {
							// get expression
	expression := func.f
							// returns a and b
	tokens := tokenf.tokenizef(expression)
							// sets the a and b
	func.set_arr(tokens)
							// does the computation
	results := func.expand()
							// stores the computation to the function..
	func.set_results(results)

}


pub fn main() {
	//println('test...')
	mut f_test := initialize_function('25x + 5', 0, -10, 10)
	f_test.do_work()
	//f_test.set_results(results)

	f_test.print_results()
}

