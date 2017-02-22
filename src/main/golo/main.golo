module poks.consumer

import poks.services.consumer

function main = |args| {

  operations("calculator:42")
    : onSet(|operations| {
      let product = operations: find(|operation| -> operation: name(): equals("product"))
      product: run([7, 10]): onSet(|data|-> println(data: result())) # == 70

      let divide = operations: find(|operation| -> operation: name(): equals("divide"))
      divide: run([50, 10]): onSet(|data|-> println(data: result())) # == 5

      let addition = operations: find(|operation| -> operation: name(): equals("addition"))
      addition: run([40, 2]): onSet(|data|-> println(data: result())) # == 42

    })
    : onFail(|error| { # if failed
      println("😡: " + error: message())
    })


}
