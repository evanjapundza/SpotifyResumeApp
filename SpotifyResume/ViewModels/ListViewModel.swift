//
//  ListViewModel.swift
//  SpotifyResume
//
//  Created by Evan Japundza on 2/23/23.
//

import Foundation
import SwiftUI

class ListViewModel: ObservableObject {
    
    @Published var listItems: [ListItem] = []
    
    init() {
        
        //Education
        listItems.append(ListItem(company: "Indiana University", type: "Education", title: "Bachelor of Science in Computer Science", date: "August 2020 - May 2024", image: "IULogo", descriptions: [
        "· Cumulative GPA: 3.51",
        "· Minor in Mathematics",
        "· Specialization: Cyber Security"
        ]))
        
        //Work Experience
        listItems.append(ListItem(company: "Scientia, LLC.", type: "Work Experience", title: "Software Engineering/Cyber Security Intern", date: "May 2022 - August 2022", image: "ScientiaLogo", descriptions: [
        "· Scanned and maintained security concerns for over 3 different machines used by the U.S. Army and Air Force",
        "· Became familiar with security techniques and policies used by the U.S. Department of Defense",
        "· Developed key functionality on software drivers in Java using RHEL virtual machine environments",
        "· Reduced regression testing time by over 50% using Python scripts",
        "· Aided in adding new features to proprietary operating systems",
        "· Practiced Agile development, including daily stand-ups and consistent backlog monitoring"
        ]))
        
        
        listItems.append(ListItem(company: "Indiana University", type: "Work Experience", title: "Undergraduate Instructor CSCI-C323 - Mobile Application Development", date: "January 2023 - Present", image: "IULogo", descriptions: [
        "· Dedicate 10+ hours per week to supplement instruction of Swift and UIKit",
        "· Aid over 60 students with homework and multiple labs every week",
        "· Coordinate with a team of 5 UIs to guarantee consistent student interactions"
        ]))
        
        
        listItems.append(ListItem(company: "Hoosier Heights Climing Gym", type: "Work Experience", title: "Desk Staff", date: "September 2021 - Present", image: "HHLogo", descriptions: [
        "· Instruct new customers on climbing equipment and techniques",
        "· Ensure gym safety for 200+ customers per shift"
        ]))
        
        
        listItems.append(ListItem(company: "Hewitt Molding Company", type: "Work Experience", title: "Manufacturing Technology Intern", date: "May 2021 - August 2021", image: "HMCLogo", descriptions: [
        "· Assisted company progress in automation of manufacturing",
        "· Maintained $40,000+ production machinery used to manufacture parts",
        "· Created fully customer-approved documentation with machines running at 99% success rate"
        ]))
        
        
        
        //Student Involvement
        listItems.append(ListItem(company: "Cyber Security Club", type: "Student Involvement", title: "Lab Developer", date: "August 2021 - Present", image: "CSCLogo", descriptions: [
            "· Develop engaging labs each week for over 350+ students and alumni to participate in",
            "· Create student interest in important security topics",
            "· Work with local organizations to provide more learning outlets for students"
        ]))
        
        //Projects
        listItems.append(ListItem(company: "Phridge", type: "Projects", title: "Recipe Search App", date: "January 2023", image: "PhridgeIcon", descriptions: [
        "· Built entirely in Swift and SwiftUI with built-in iOS frameworks like CoreData",
        "· Unique search-by-ingredient recipe finder using Spoonacular API",
        "· Presents over 100 recipes in dating app style format each search",
        "· Plans to continue development and release on Apple’s App Store"
        ]))
        
        
        
        listItems.append(ListItem(company: "Spotify Resume App", type: "Projects", title: "Resume App", date: "February 2023", image: "SpotifyLogo", descriptions: [
        "· Unique application that presents my resume in the style of the Spotify App",
        "· Demonstrates knowledge of Swift, SwiftUI, and Object-Oriented Programming",
        "· Follows View-Model-ViewModel design pattern"
        ]))
        
        //Skills
        
        
        listItems.append(ListItem(company: "", type: "Skills", title: "Languages", date: "", image: "SwiftLogo", descriptions: [
        "· Swift (UIKit/SwiftUI)",
        "· Java",
        "· Python",
        "· C/C++",
        "· SQL",
        "· Ladder Logic"
        ]))
        
        listItems.append(ListItem(company: "", type: "Skills", title: "Platforms", date: "", image: "iOSLogo", descriptions: [
        "· iOS",
        "· MacOS",
        "· Windows",
        "· UNIX"
        ]))
        
        listItems.append(ListItem(company: "", type: "Skills", title: "Web Development", date: "", image: "JSLogo", descriptions: [
        "· HTML",
        "· CSS",
        "· Javascript",
        "· React",
        "· Node.js"
        ]))
        
        listItems.append(ListItem(company: "", type: "Skills", title: "Miscellaneous", date: "", image: "MiscIcon", descriptions: [
        "· Student Pilot",
        "· Microsoft Excel",
        "· Programmable Logic Controllers",
        "· Computer-aided Design"
        ]))
    }
}
