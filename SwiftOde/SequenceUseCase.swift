//
//  SequenceUseCase.swift
//  ios-babel-fish
//
//  Created by caio sanchez christino on 03/12/21.
//
import Foundation

open class SequenceUseCase : UseCase<Any, [Output<Any>]> {
    var units : [UseCaseUnit] = []
    private var stream : [Output<Any>] = []
    
    override init() { }
    
    init(units: [UseCaseUnit]) {
        self.units = units
    }
    
    public override func execute(param: Any?) -> Output<[Output<Any>]> {
        doExecute(param: param)
    }
    
    public func doExecute(param: Any?) -> Output<[Output<Any>]> {
        for unit in units {
            let output = unit.processToDo!()
            stream.append(output)
        }
        return ValueOutput(value: stream)
    }
    
    public class SequenceBuilder {
        public init() { }
        
        private var sequence: [UseCaseUnit] = []
        
        public func add<P,R>(useCase: UseCase<P,R>, param: P? = nil) -> SequenceBuilder {
            let useCaseUnit = UseCaseUnit()
            useCaseUnit.processToDo = {
              let output = useCaseUnit.process(useCase: useCase, param:param)
              return Output<Any>(value: output.value, error: output.error)
            }
            sequence.append(useCaseUnit)
            return self
        }
        
        public func build() -> UseCase<Any , [Output<Any>]> {
            return SequenceUseCase(units: sequence)
        }
    }
}

