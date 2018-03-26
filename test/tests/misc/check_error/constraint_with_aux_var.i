[Mesh]
  type = GeneratedMesh
  dim = 2
  nx = 2
  ny = 2
[]

[Variables]
  [./u]
    order = FIRST
    family = LAGRANGE
  [../]
[]

[AuxVariables]
  [./v]
  [../]
[]

[Constraints]
  [./nope]
    type = CoupledTiedValueConstraint
    variable = v
    slave = 2
    master = 3
    master_variable = u
  [../]
[]

[BCs]
  [./left]
    type = DirichletBC
    variable = u
    boundary = 1
    value = 0
  [../]

  [./right]
    type = DirichletBC
    variable = u
    boundary = 2
    value = 1
  [../]
[]

[Executioner]
  type = Steady
  solve_type = 'NEWTON'
[]

[Outputs]
  file_base = out
  exodus = true
[]