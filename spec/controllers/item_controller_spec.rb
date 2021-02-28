require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
    render_views

    let(:items) { create_list :item, 5 } # Доступно на каждом тесте
    let(:item) { create :item }

    let(:items_params) do # Создаём items_params
    { 
        item:{ 
            name: 'car',
            price: 50,
            description: 'black'

        }
    }
    end 

    context 'GET #index' do
        
        before { get :index }
        
        it 'returns items' do
            #binding.pry
            is_expected.to render_template :index 
            expect(assigns :items).to match_array items 
        end
        
        
    end

    context 'POST #create' do
        subject { post :create, params: items_params }
        
        it 'saves the item' do
            expect { subject }.to change(Item, :count).by 1 #Сохраняет в БД и увеличивается на 1
        end

        it 'redirect to index' do
            expect( subject ).to redirect_to action: :index 
            
        end
        

    context 'with invalid params' do # Передаём неправильное значение price 
        let(:items_params) do
            {item: { price: -20 } }
        end

        it 'dosnt save' do
            expect{subject}.to_not change(Item, :count)
               end

        it 'render new template' do
            is_expected.to render_template :new
            
        end
    end
end

    context 'DELETE #destroy' do
        subject { delete :destroy, params: params }
        let(:params) { { id: item.id} } 

        it 'deletes from Item' do
            item.reload
            expect { subject }.to change(Item, :count).by (-1 )
            
        end
        
        it 'redirect index template' do
            is_expected.to redirect_to action: :index 
            
        end
        
    end
    
end