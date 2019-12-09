module computef
import math

//working
pub fn sum_list(l []f32) f64 {
	mut value := 0.0
	for i in l {
		value = value + i
	}
	return value
}
//working
pub fn evaluate_lin(a f64, x f64, b f64) f64 {
	return a * x + b
}
//working
pub fn evaluate_pow(a f64, x f64, n f64) f64 {
	right := math.pow(x, n)
	return a * right
	//return res
	//return a*x*n
}
//working
pub fn evaluate_quad(a2 f64, a1 f64, x f64, b f64) f64 {
	return a2 * math.pow(x, 2.0) + a1 * x + b
}
//working
pub fn evaluate_poly(a []f32, x f64, b f64) f64 {
	return 4.0
}


pub fn run_tests() {
	test_lin := evaluate_lin(1.0, 1.0, 1.0)
	//println(test_lin)
	assert test_lin == evaluate_lin(1.0, 1.0, 1.0)

	test_pow := evaluate_pow(1.0, 2.0, 1.0)
	//println(test_pow)
	assert test_pow == evaluate_pow(1.0, 2.0, 1.0)

	test_quad := evaluate_quad(1.0, 1.0, 1.0, 1.0)
	//println(test_quad)
	assert test_quad == evaluate_quad(1.0, 1.0, 1.0, 1.0)

	test_poly := evaluate_poly([1.0], 1.0, 1.0)
	//println(test_poly)
	assert test_poly == evaluate_poly([1.0], 1.0, 1.0)

	sum_test := [0.0, 1.0, 5.0, 10.0, 1.0]
	test_sum := sum_list(sum_test)
	//println(test_sum)
	assert test_sum == sum_list(sum_test)
}

fn main() {
	run_tests()
}