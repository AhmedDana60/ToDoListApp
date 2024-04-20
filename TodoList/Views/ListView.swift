//
//  ListView.swift
//  TodoList
//
//  Created by Ahmed Dana Mohammed on 3/12/24.
//

import SwiftUI

struct ListView: View {
   
    @EnvironmentObject var listViewModel: ListViewModel
   
    var body: some View {
        ZStack{
            if listViewModel.items.isEmpty {
               NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                List {
                    ForEach(listViewModel.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear){
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deletItem)
                    .onMove(perform: listViewModel.moveItem)
                   }
                .listStyle(PlainListStyle())
            }
        }
        .navigationTitle("Todo List 📝")
            .navigationBarItems(
                leading: EditButton(),
                trailing: NavigationLink("Add", destination: AddView()))
    }
   
}

#Preview {
    NavigationView {
        ListView()
            .environmentObject(ListViewModel())
    }
}


