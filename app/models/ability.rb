class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      if user.kind == 'salesman'
        can :access, :rails_admin
        can :dashboard
        can :manage, Client, user_id: user.id # vendedor pode gerenciar seus clientes
        can :manage, Sale, user_id: user.id # vendedor pode gerenciar suas vendas
        can :read, Product, status: :active # vendedor só pode ver produtos ativos
        can :read, Discount, status: :active # vendedor só pode ver discontos ativos
        can :read, Comission, user_id: user.id # vendedor só pode ver suas comissões
        can :manage, ProductQuantity, user_id: user.id
        can :manage, Address, user_id: user.id
      elsif user.kind == 'manager'
        can :manage, :all # administrador pode gerenciar tudo
      end
    end
  end
end
