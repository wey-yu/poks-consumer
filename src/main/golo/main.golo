module poks.consumer

import poks.services.consumer

function main = |args| {

  # get the services list from server
  services()
    : onSet(|servicesList| {
      servicesList: each(|service| { println(service) })
    })
    : onFail(|error| { # if failed
      println("😡: " + error: message())
    })

  # use operations of the "calculator:42" service
  operations("calculator:42")
    : onSet(|operations| {

      operations: product(7, 10): onSet(|data|-> println(data: result())) # == 70

      operations: divide(50, 10): onSet(|data|-> println(data: result())) # == 5

      operations: addition(40, 2): onSet(|data|-> println(data: result())) # == 42

      operations: concat(DynamicObject(): a("Hello"): b(" world!!!"))
        : onSet(|data|-> println(data: result())) # Hello world!!!

    })
    : onFail(|error| { # if failed
      println("😡: " + error: message())
    })



}
