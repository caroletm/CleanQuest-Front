//
//  ContentView.swift
//  CleanQuest_Front
//
//  Created by caroletm on 27/02/2026.
//

import SwiftUI

struct ContentView: View {
    
    @State private var navigationVM = NavigationViewModel()
    @State private var authVM: AuthViewModel
    @State private var userVM: UserViewModel
    @State private var foyerVM = FoyerViewModel()
    
    init() {
        
        let userVM = UserViewModel()
        self._userVM = State(initialValue: userVM)
        self._authVM = State(initialValue: AuthViewModel(userVM: userVM))
        
    }
    
    var body: some View {
        
        ZStack{
            NavigationStack (path : $navigationVM.path) {
                Group {
                    
                    if authVM.isAuthenticated {
                        if authVM.firstConnection {
                            FoyerMenu()
                        }else{
                            EmptyView()
                        }
                       
                    }else if authVM.showSplash {
                        SplashScreen()
                    }else if authVM.showLogin {
                        Login()
                    }else if authVM.showSignIn {
                        SignIn()
                    }
                }
                .navigationDestination(for: AppRoute.self) { route in
                    switch route {
                    case .login:
                        Login()
                    case .signIn:
                        SignIn()
                    case .createProfile:
                        CreateProfile()
                    case .forgotPassword:
                        ForgottenPasswordScreen()
                    case .settings:
                        Settings()
                    case .foyerMenu:
                        FoyerMenu()
                    case .joinFoyer:
                        JoinFoyer()
                    case .createFoyer:
                        CreateFoyer()
                    }
                }
            }
            .environment(userVM)
            .environment(navigationVM)
            .environment(authVM)
            .environment(foyerVM)
        }
    }
}

#Preview {
    let userVM = UserViewModel()
    ContentView()
        .environment(NavigationViewModel())
        .environment(userVM)
        .environment(AuthViewModel(userVM : userVM))
        .environment(FoyerViewModel())
}
