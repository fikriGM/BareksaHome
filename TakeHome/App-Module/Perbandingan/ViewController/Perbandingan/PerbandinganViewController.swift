//
//  PerbandinganViewController.swift
//  TakeHome
//
//  Created by Cashlez Macbook 2021 on 7/30/22.
//

import Foundation
import UIKit
import Charts
import Combine


@available(iOS 13.0, *)
class PerbandinganViewController: BaseViewController<PerbandinganViewModel> {
    
    var perbandingView = PerbandinganView()
    var isImbalTapped : Bool = true
    var isDanaKelolaanTapped : Bool = false
    
    var observer: [AnyCancellable] = []
    
    var is1WTapped: Bool = false
    var isAllTapped: Bool = false
    
    var contentViewResultChart = UIView()
    var imageRound1 = UIImageView()
    var labelImageRound1 = UILabel()
    var imageRound2 = UIImageView()
    var labelImageRound2 = UILabel()
    var imageRound3 = UIImageView()
    var labelImageRound3 = UILabel()
    var labelTahun = UILabel()
    
    //Chart
    var lineChartView = LineChartView()
    
    var contentSelectChart = UIView()
    var segmentLine1 = UIView()
    let buttonDict1 = [1:["1W"], 2:["1M"], 3:["1Y"],4:["3Y"],5:["5Y"], 6:["10Y"],7:["ALL"]]
    let buttonDict2 = [8:["1WS"], 9:["1MS"], 10:["1YS"], 11:["3YS"], 12:["5YS"], 13:["10YS"], 14:["ALLS"]]
    
    var collor: [UIColor] = [.red, .blue, .black, .systemBrown, .systemPink, .green];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addSafeBackground(top: .white, bottom: .white)
        self.addViewPerbanding()
        self.viewModel = PerbandinganViewModel()
        self.setupViewModelObsever()
        if isImbalTapped {
            setImbalMenu()
            self.view.layoutIfNeeded()
         
        }
    }
    
    fileprivate func addViewPerbanding() {
        if #available(iOS 11, *){
            perbandingView = PerbandinganView(frame: self.view.safeAreaLayoutGuide.layoutFrame)
        } else {
            perbandingView = PerbandinganView(frame: CGRect(x: 0, y: getStatusBarHeight(), width: self.view.frame.size.width, height: self.view.frame.size.height-self.getStatusBarHeight()))
        }
        
        perbandingView.segment1.addTarget(self, action: #selector(imbalMenu(_:)), for: .touchUpInside)
        perbandingView.segment2.addTarget(self, action: #selector(danaMenu(_:)), for: .touchUpInside)
      
        self.view.addSubview(perbandingView)
    }
    
    @objc fileprivate func imbalMenu(_ sender: UIButton) {
        isImbalTapped = true
        isDanaKelolaanTapped = false
        self.setImbalMenu()
        self.setupViewModelObsever()
        self.perbandingView.contentScrollView.isHidden = false
        self.perbandingView.contentDanaScrollView.isHidden = true
        self.changeSegmenMenu(Imbal: isImbalTapped, Dana: isDanaKelolaanTapped)
    }
    
    @objc fileprivate func danaMenu(_ sender: UIButton) {
        isImbalTapped = false
        isDanaKelolaanTapped = true
        self.perbandingView.contentScrollView.isHidden = true
        self.perbandingView.contentDanaScrollView.isHidden = false
        self.changeSegmenMenu(Imbal: isImbalTapped, Dana: isDanaKelolaanTapped)
    }
    
    fileprivate func changeSegmenMenu(Imbal: Bool, Dana: Bool) {
        perbandingView.segment1.setTitleColor(Imbal ? #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1) : UIColor.gray, for: .normal)
        perbandingView.segmentLine1.backgroundColor = Imbal ? #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1) : .white
        
        perbandingView.segment2.setTitleColor(Dana ? #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1) : UIColor.gray, for: .normal)
        perbandingView.segmentLine2.backgroundColor = Dana ? #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1) : .white
    }
    
    fileprivate func setImbalMenu() {
       
        contentViewResultChart.translatesAutoresizingMaskIntoConstraints = false
        perbandingView.contentScrollView.addSubview(contentViewResultChart)
        contentViewResultChart.topAnchor.constraint(equalTo: perbandingView.contentScrollView.topAnchor, constant: 40).isActive = true
        contentViewResultChart.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        contentViewResultChart.heightAnchor.constraint(equalToConstant: 20).isActive = true
        contentViewResultChart.widthAnchor.constraint(equalToConstant: 300).isActive = true
        contentViewResultChart.backgroundColor = #colorLiteral(red: 0.8261541724, green: 0.8365543485, blue: 0.8363713622, alpha: 1)
        contentViewResultChart.layer.cornerRadius = 4
        
        imageRound1.translatesAutoresizingMaskIntoConstraints = false
        contentViewResultChart.addSubview(imageRound1)
        imageRound1.leftAnchor.constraint(equalTo: contentViewResultChart.leftAnchor, constant: 5).isActive = true
        imageRound1.topAnchor.constraint(equalTo: contentViewResultChart.topAnchor, constant: 0).isActive = true
        imageRound1.widthAnchor.constraint(equalToConstant: 15).isActive = true
        imageRound1.heightAnchor.constraint(equalToConstant: 15).isActive = true
        imageRound1.centerYAnchor.constraint(equalTo: contentViewResultChart.centerYAnchor, constant: 0).isActive = true
        imageRound1.image = UIImage(named: "icons8-round-green")
        imageRound1.contentMode = .scaleAspectFit
        
        labelImageRound1.translatesAutoresizingMaskIntoConstraints = false
        contentViewResultChart.addSubview(labelImageRound1)
        labelImageRound1.leftAnchor.constraint(equalTo: imageRound1.leftAnchor, constant: 15).isActive = true
        labelImageRound1.topAnchor.constraint(equalTo: contentViewResultChart.topAnchor).isActive = true
        labelImageRound1.widthAnchor.constraint(equalToConstant: 45).isActive = true
        labelImageRound1.heightAnchor.constraint(equalToConstant: 20).isActive = true
        labelImageRound1.centerYAnchor.constraint(equalTo: imageRound1.centerYAnchor, constant: 0).isActive = true
        labelImageRound1.text = "36%"
        labelImageRound1.textColor = .black
        labelImageRound1.font = .systemFont(ofSize: 11, weight: .bold)
        
        imageRound2.translatesAutoresizingMaskIntoConstraints = false
        contentViewResultChart.addSubview(imageRound2)
        imageRound2.leftAnchor.constraint(equalTo: labelImageRound1.leftAnchor, constant: 45).isActive = true
        imageRound2.topAnchor.constraint(equalTo: imageRound1.topAnchor).isActive = true
        imageRound2.centerYAnchor.constraint(equalTo: contentViewResultChart.centerYAnchor, constant: 0).isActive = true
        imageRound2.widthAnchor.constraint(equalToConstant: 15).isActive = true
        imageRound2.heightAnchor.constraint(equalToConstant: 15).isActive = true
        imageRound2.image = UIImage(named: "icons8-round-purple")
        imageRound2.contentMode = .scaleAspectFit
        
        labelImageRound2.translatesAutoresizingMaskIntoConstraints = false
        contentViewResultChart.addSubview(labelImageRound2)
        labelImageRound2.leftAnchor.constraint(equalTo: imageRound2.leftAnchor, constant: 15).isActive = true
        labelImageRound2.topAnchor.constraint(equalTo: contentViewResultChart.topAnchor).isActive = true
        labelImageRound2.widthAnchor.constraint(equalToConstant: 50).isActive = true
        labelImageRound2.heightAnchor.constraint(equalToConstant: 20).isActive = true
        labelImageRound2.centerYAnchor.constraint(equalTo: imageRound1.centerYAnchor, constant: 0).isActive = true
        labelImageRound2.text = "30%"
        labelImageRound2.textColor = .black
        labelImageRound2.font = .systemFont(ofSize: 11, weight: .bold)
        
        imageRound3.translatesAutoresizingMaskIntoConstraints = false
        contentViewResultChart.addSubview(imageRound3)
        imageRound3.leftAnchor.constraint(equalTo: labelImageRound2.leftAnchor, constant: 35).isActive = true
        imageRound3.topAnchor.constraint(equalTo: imageRound1.topAnchor).isActive = true
        imageRound3.centerYAnchor.constraint(equalTo: contentViewResultChart.centerYAnchor, constant: 0).isActive = true
        imageRound3.widthAnchor.constraint(equalToConstant: 15).isActive = true
        imageRound3.heightAnchor.constraint(equalToConstant: 15).isActive = true
        imageRound3.image = UIImage(named: "icons8-round-blue")
        imageRound3.contentMode = .scaleAspectFit
        
        labelImageRound3.translatesAutoresizingMaskIntoConstraints = false
        contentViewResultChart.addSubview(labelImageRound3)
        labelImageRound3.leftAnchor.constraint(equalTo: imageRound3.leftAnchor, constant: 15).isActive = true
        labelImageRound3.topAnchor.constraint(equalTo: contentViewResultChart.topAnchor).isActive = true
        labelImageRound3.widthAnchor.constraint(equalToConstant: 50).isActive = true
        labelImageRound3.heightAnchor.constraint(equalToConstant: 20).isActive = true
        labelImageRound3.centerYAnchor.constraint(equalTo: imageRound1.centerYAnchor, constant: 0).isActive = true
        labelImageRound3.text = "3550%"
        labelImageRound3.textColor = .black
        labelImageRound3.font = .systemFont(ofSize: 11, weight: .bold)
        
        labelTahun.translatesAutoresizingMaskIntoConstraints = false
        contentViewResultChart.addSubview(labelTahun)
        labelTahun.leftAnchor.constraint(equalTo: labelImageRound3.leftAnchor, constant: 45).isActive = true
        labelTahun.topAnchor.constraint(equalTo: contentViewResultChart.topAnchor).isActive = true
        labelTahun.widthAnchor.constraint(equalToConstant: 150).isActive = true
        labelTahun.heightAnchor.constraint(equalToConstant: 20).isActive = true
        labelTahun.centerYAnchor.constraint(equalTo: imageRound1.centerYAnchor, constant: 0).isActive = true
        labelTahun.text = "(2020 Januari 30)"
        labelTahun.textColor = .systemGray
        labelTahun.font = .systemFont(ofSize: 12, weight: .bold)
        
        lineChartView.translatesAutoresizingMaskIntoConstraints = false
        perbandingView.contentScrollView.addSubview(lineChartView)
        lineChartView.topAnchor.constraint(equalTo: contentViewResultChart.topAnchor, constant: 25).isActive = true
        lineChartView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        lineChartView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        lineChartView.widthAnchor.constraint(equalToConstant: Constants.screenWidth - 20).isActive = true
        lineChartView.leftAxis.enabled = false
        lineChartView.rightAxis.enabled = true
        
        let yAxis = lineChartView.rightAxis
        yAxis.labelFont = .systemFont(ofSize: 14, weight: .bold)
        yAxis.setLabelCount(6, force: false)
        yAxis.labelTextColor = .black
        yAxis.axisLineColor = .black
        yAxis.labelPosition = .outsideChart
        
        lineChartView.xAxis.labelPosition = .bottom
        lineChartView.xAxis.labelFont = .systemFont(ofSize: 14, weight: .bold)
        lineChartView.xAxis.setLabelCount(6, force: false)
        lineChartView.xAxis.labelTextColor = .white
        lineChartView.xAxis.axisLineColor = .clear
        lineChartView.animate(xAxisDuration: 2.5)
        lineChartView.xAxis.gridLineDashPhase = 0
        
        contentSelectChart.translatesAutoresizingMaskIntoConstraints = false
        perbandingView.contentScrollView.addSubview(contentSelectChart)
        contentSelectChart.topAnchor.constraint(equalTo: lineChartView.bottomAnchor, constant: 10).isActive = true
        contentSelectChart.leftAnchor.constraint(equalTo: lineChartView.leftAnchor).isActive = true
        contentSelectChart.widthAnchor.constraint(equalToConstant: Constants.screenWidth - 20).isActive = true
        contentSelectChart.heightAnchor.constraint(equalToConstant: 50).isActive = true
        contentSelectChart.isUserInteractionEnabled = true
        
        let calcStackView1 = rowCreate(arr: buttonDict1)
        let stackView = UIStackView(arrangedSubviews: [calcStackView1])
        contentSelectChart.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: contentSelectChart.topAnchor, constant: 0).isActive = true
        stackView.leadingAnchor.constraint(equalTo: contentSelectChart.leadingAnchor, constant: Constants.screenWidth*0.014).isActive = true
        stackView.widthAnchor.constraint(equalTo: contentSelectChart.widthAnchor, multiplier: 0.95).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 1
        
        let calcStackView2 = rowCreateView(arr: buttonDict2)
        let stackView2 = UIStackView(arrangedSubviews: [calcStackView2])
        contentSelectChart.addSubview(stackView2)
        stackView2.translatesAutoresizingMaskIntoConstraints = false
        stackView2.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 0).isActive = true
        stackView2.leadingAnchor.constraint(equalTo: contentSelectChart.leadingAnchor, constant: Constants.screenWidth*0.014).isActive = true
        stackView2.widthAnchor.constraint(equalTo: contentSelectChart.widthAnchor, multiplier: 0.95).isActive = true
        stackView2.heightAnchor.constraint(equalToConstant: 2).isActive = true
        stackView2.axis = .vertical
        stackView2.distribution = .fillEqually
        stackView2.alignment = .fill
        stackView2.spacing = 1
        
    }
    
    func setupViewModelObsever() {
        if viewModel != nil {
            self.viewModel!.isLoading = true
            self.view.showLoader()
            
            //MARK: FETCH DATA CHART
            self.viewModel?.fetchDataChart()?.receive(on: DispatchQueue.main).sink(receiveCompletion: { [weak self] completion in
                self?.viewModel?.isLoading = false
                self?.view.hideLoad()
                
                switch completion {
                case .finished:
                    print("finish Calling data Chart")
                case .failure(let errorResponse):
                    self?.showAlert(title: "Error Fetch Data Chart", message: errorResponse.message, completion: { [weak self] action in
                        self?.dismiss(animated: true)
                    })
                }
            }, receiveValue: { [weak self] response in
                print("Response chart Successfully parsed with \(String(describing: response))")
                
                let modelChart = self?.viewModel
                if response != nil {
                    
                    self?.onSetDataChart(response: response as! ImbalChartResponse)
                }
                
                
            }).store(in: &observer)
            
            
            //MARK: FETCH DATA IMBAL
            self.viewModel!.fetchData()?.receive(on: DispatchQueue.main).sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .finished:
                    print("finish calling")
                case .failure(let error):
                    self?.showAlert(title: "Error Fetch Data Detail", message: error.message, completion: { [weak self] action in
                        self?.dismiss(animated: true)
                        
                    })
                }
            }, receiveValue: { [weak self] response in
                print("Response Successfully parsed with \(String(describing: response))")
                
                let model = self?.viewModel
                if response != nil {
                    model?.handleResponse(response: response as! ImbalDataResponse)
                    self?.onSetDataCollection(response: response as! ImbalDataResponse)
                    
                }
            }).store(in: &observer)
        }
        
    }
    
    @objc func allAction(_ sender:UIButton){
        sender.setTitleColor( #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1) ,for: .normal)
       
        self.showToast(message: "\(sender.titleLabel?.text)", font: .systemFont(ofSize: 14, weight: .bold))
    }
    
    @objc func satuWAction(_ sender: UIButton) {
        sender.setTitleColor( #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1) ,for: .normal)
    }
    
    fileprivate func changeSegmenTapped(isAllTapped: Bool, is1WTapped: Bool, sender: UIButton) {
      
      
        sender.setTitleColor(isAllTapped ? #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1) : UIColor.gray, for: .normal)
    }
   
    
    func onSetDataCollection(response: ImbalDataResponse) {
        let viewImbalContainer = UIView()
        perbandingView.contentScrollView.addSubview(viewImbalContainer)
        viewImbalContainer.translatesAutoresizingMaskIntoConstraints = false
        viewImbalContainer.topAnchor.constraint(equalTo: contentSelectChart.bottomAnchor, constant: 10).isActive = true
        viewImbalContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        viewImbalContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        viewImbalContainer.heightAnchor.constraint(equalTo: perbandingView.contentScrollView.heightAnchor).isActive = true
        viewImbalContainer.widthAnchor.constraint(equalTo: perbandingView.contentScrollView.widthAnchor).isActive = true
        viewImbalContainer.backgroundColor = #colorLiteral(red: 0.9343366623, green: 0.9460987449, blue: 0.9458919168, alpha: 1)
        
        let buttonName = [1:[response.data[0].name, #colorLiteral(red: 0.6530216336, green: 0.970919311, blue: 0.4911792278, alpha: 1)], 2: [response.data[1].name, #colorLiteral(red: 0.7620763183, green: 0.6782852411, blue: 0.9809553027, alpha: 1)], 3:[response.data[2].name, #colorLiteral(red: 0.466316998, green: 0.8900380731, blue: 0.980666101, alpha: 1)]]
        let buttonJenis = [4:[response.data[0].details.type, #colorLiteral(red: 0.6530216336, green: 0.970919311, blue: 0.4911792278, alpha: 1)], 5: [response.data[1].details.type, #colorLiteral(red: 0.7620763183, green: 0.6782852411, blue: 0.9809553027, alpha: 1)], 6:[response.data[2].details.type, #colorLiteral(red: 0.466316998, green: 0.8900380731, blue: 0.980666101, alpha: 1)]]
        
        let buttonMinBalance = [7:[response.data[0].details.min_balance, #colorLiteral(red: 0.6530216336, green: 0.970919311, blue: 0.4911792278, alpha: 1)], 8: [response.data[1].details.min_balance, #colorLiteral(red: 0.7620763183, green: 0.6782852411, blue: 0.9809553027, alpha: 1)], 9:[response.data[2].details.min_balance, #colorLiteral(red: 0.466316998, green: 0.8900380731, blue: 0.980666101, alpha: 1)]]
        let buttonTingkatResiko = [10:["Tinggi", #colorLiteral(red: 0.6530216336, green: 0.970919311, blue: 0.4911792278, alpha: 1)], 11: ["Rendah", #colorLiteral(red: 0.7620763183, green: 0.6782852411, blue: 0.9809553027, alpha: 1)], 12:["Tinggi", #colorLiteral(red: 0.466316998, green: 0.8900380731, blue: 0.980666101, alpha: 1)]]
        let buttonLuncur = [10:[response.data[0].details.inception_date, #colorLiteral(red: 0.6530216336, green: 0.970919311, blue: 0.4911792278, alpha: 1)], 11: [response.data[1].details.inception_date, #colorLiteral(red: 0.7620763183, green: 0.6782852411, blue: 0.9809553027, alpha: 1)], 12:[response.data[2].details.inception_date, #colorLiteral(red: 0.466316998, green: 0.8900380731, blue: 0.980666101, alpha: 1)]]
        let calName = rowCreateName(arr: buttonName)
        let calType = rowCreateName(arr: buttonJenis)
        let calMinBalance = rowCreateName(arr: buttonMinBalance)
        let calTingkatResiko = rowCreateName(arr: buttonTingkatResiko)
        let callPeluncur = rowCreateName(arr: buttonLuncur)
        
        let stackView = UIStackView(arrangedSubviews: [calName])
        viewImbalContainer.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: viewImbalContainer.topAnchor, constant: 3).isActive = true
        stackView.leadingAnchor.constraint(equalTo: contentSelectChart.leadingAnchor, constant: Constants.screenWidth*0.014).isActive = true
        stackView.widthAnchor.constraint(equalTo: perbandingView.contentScrollView.widthAnchor, multiplier: 0.95).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 10
        stackView.layoutMargins = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        stackView.isLayoutMarginsRelativeArrangement = true
       
        let labelType = UILabel()
        viewImbalContainer.addSubview(labelType)
        labelType.translatesAutoresizingMaskIntoConstraints = false
        labelType.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 10).isActive = true
        labelType.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        labelType.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        labelType.widthAnchor.constraint(equalTo: perbandingView.contentScrollView.widthAnchor, multiplier: 0.95).isActive = true
        labelType.heightAnchor.constraint(equalToConstant: 30).isActive = true
        labelType.text = "Jenis Reksa Dana"
        labelType.textColor = .gray
        labelType.font = .systemFont(ofSize: 14, weight: .regular)

        let stackView2 = UIStackView(arrangedSubviews: [calType])
        viewImbalContainer.addSubview(stackView2)
        stackView2.translatesAutoresizingMaskIntoConstraints = false
        stackView2.topAnchor.constraint(equalTo: labelType.bottomAnchor, constant: 1).isActive = true
        stackView2.leadingAnchor.constraint(equalTo: contentSelectChart.leadingAnchor, constant: Constants.screenWidth*0.014).isActive = true
        stackView2.widthAnchor.constraint(equalTo: perbandingView.contentScrollView.widthAnchor, multiplier: 0.95).isActive = true
        stackView2.heightAnchor.constraint(equalToConstant: 30).isActive = true
        stackView2.axis = .vertical
        stackView2.distribution = .fillEqually
        stackView2.alignment = .fill
        stackView2.spacing = 1
        
        let labelTingkatResiko = UILabel()
        viewImbalContainer.addSubview(labelTingkatResiko)
        labelTingkatResiko.translatesAutoresizingMaskIntoConstraints = false
        labelTingkatResiko.topAnchor.constraint(equalTo: stackView2.bottomAnchor, constant: 10).isActive = true
        labelTingkatResiko.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        labelTingkatResiko.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        labelTingkatResiko.widthAnchor.constraint(equalTo: perbandingView.contentScrollView.widthAnchor, multiplier: 0.95).isActive = true
        labelTingkatResiko.heightAnchor.constraint(equalToConstant: 30).isActive = true
        labelTingkatResiko.text = "Tingkat Resiko"
        labelTingkatResiko.textColor = .gray
        labelTingkatResiko.font = .systemFont(ofSize: 14, weight: .regular)

        let stackView3 = UIStackView(arrangedSubviews: [calTingkatResiko])
        viewImbalContainer.addSubview(stackView3)
        stackView3.translatesAutoresizingMaskIntoConstraints = false
        stackView3.topAnchor.constraint(equalTo: labelTingkatResiko.bottomAnchor, constant: 1).isActive = true
        stackView3.leadingAnchor.constraint(equalTo: contentSelectChart.leadingAnchor, constant: Constants.screenWidth*0.014).isActive = true
        stackView3.widthAnchor.constraint(equalTo: perbandingView.contentScrollView.widthAnchor, multiplier: 0.95).isActive = true
        stackView3.heightAnchor.constraint(equalToConstant: 30).isActive = true
        stackView3.axis = .vertical
        stackView3.distribution = .fillEqually
        stackView3.alignment = .fill
        stackView3.spacing = 1
        
        let labelMinBalance = UILabel()
        viewImbalContainer.addSubview(labelMinBalance)
        labelMinBalance.translatesAutoresizingMaskIntoConstraints = false
        labelMinBalance.topAnchor.constraint(equalTo: stackView3.bottomAnchor, constant: 10).isActive = true
        labelMinBalance.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        labelMinBalance.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        labelMinBalance.widthAnchor.constraint(equalTo: perbandingView.contentScrollView.widthAnchor, multiplier: 0.95).isActive = true
        labelMinBalance.heightAnchor.constraint(equalToConstant: 30).isActive = true
        labelMinBalance.text = "Min Pembelian"
        labelMinBalance.textColor = .gray
        labelMinBalance.font = .systemFont(ofSize: 14, weight: .regular)

        let stackView4 = UIStackView(arrangedSubviews: [calMinBalance])
        viewImbalContainer.addSubview(stackView4)
        stackView4.translatesAutoresizingMaskIntoConstraints = false
        stackView4.topAnchor.constraint(equalTo: labelMinBalance.bottomAnchor, constant: 1).isActive = true
        stackView4.leadingAnchor.constraint(equalTo: contentSelectChart.leadingAnchor, constant: Constants.screenWidth*0.014).isActive = true
        stackView4.widthAnchor.constraint(equalTo: perbandingView.contentScrollView.widthAnchor, multiplier: 0.95).isActive = true
        stackView4.heightAnchor.constraint(equalToConstant: 30).isActive = true
        stackView4.axis = .vertical
        stackView4.distribution = .fillEqually
        stackView4.alignment = .fill
        stackView4.spacing = 1
        
        let labelLuncur = UILabel()
        viewImbalContainer.addSubview(labelLuncur)
        labelLuncur.translatesAutoresizingMaskIntoConstraints = false
        labelLuncur.topAnchor.constraint(equalTo: stackView4.bottomAnchor, constant: 10).isActive = true
        labelLuncur.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        labelLuncur.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        labelLuncur.widthAnchor.constraint(equalTo: perbandingView.contentScrollView.widthAnchor, multiplier: 0.95).isActive = true
        labelLuncur.heightAnchor.constraint(equalToConstant: 30).isActive = true
        labelLuncur.text = "Perluncuran"
        labelLuncur.textColor = .gray
        labelLuncur.font = .systemFont(ofSize: 14, weight: .regular)

        let stackView5 = UIStackView(arrangedSubviews: [callPeluncur])
        viewImbalContainer.addSubview(stackView5)
        stackView5.translatesAutoresizingMaskIntoConstraints = false
        stackView5.topAnchor.constraint(equalTo: labelLuncur.bottomAnchor, constant: 1).isActive = true
        stackView5.leadingAnchor.constraint(equalTo: contentSelectChart.leadingAnchor, constant: Constants.screenWidth*0.014).isActive = true
        stackView5.widthAnchor.constraint(equalTo: perbandingView.contentScrollView.widthAnchor, multiplier: 0.95).isActive = true
        stackView5.heightAnchor.constraint(equalToConstant: 30).isActive = true
        stackView5.axis = .vertical
        stackView5.distribution = .fillEqually
        stackView5.alignment = .fill
        stackView5.spacing = 1
    }
    
    func onSetDataChart(response: ImbalChartResponse) {
        let values = (0..<response.data!.KI002MMCDANCAS00.data.count).map { (i) -> ChartDataEntry in
            let val = response.data!.KI002MMCDANCAS00.data[i].growth!
            let vael = response.data!.KI002MMCDANCAS00.data[i].value
            return ChartDataEntry(x: Double(i), y: vael)
        }
        
        let values2 = (0..<response.data!.NI002EQCDANSIE00.data.count).map { (i) -> ChartDataEntry in
            let val = response.data!.NI002EQCDANSIE00.data[i].growth!
            let vael = response.data!.NI002EQCDANSIE00.data[i].value
            return ChartDataEntry(x: Double(i), y: vael)
        }
        
        let values3 = (0..<response.data!.TP002EQCEQTCRS00.data.count).map { (i) -> ChartDataEntry in
            let val = response.data!.TP002EQCEQTCRS00.data[i].growth!
            let vael = response.data!.TP002EQCEQTCRS00.data[i].value
            return ChartDataEntry(x: Double(i), y: vael)
        }
       
        let set1 = LineChartDataSet(entries: values, label: nil)
        set1.mode = .linear
        set1.drawCirclesEnabled = false
        set1.setColor(#colorLiteral(red: 0.6530216336, green: 0.970919311, blue: 0.4911792278, alpha: 1))
        set1.lineWidth = 3
        set1.highlightEnabled = true
        set1.drawIconsEnabled = false
        set1.drawFilledEnabled = false
        set1.highlightEnabled = true
        set1.drawCircleHoleEnabled = false
        set1.highlightLineDashPhase = 2
        set1.highlightColor = UIColor(red: 244/255, green: 117/255, blue: 117/255, alpha: 1)
        set1.valueFont = .systemFont(ofSize: 9)
        set1.formLineWidth = 1
        set1.fillFormatter = DefaultFillFormatter { _,_  -> CGFloat in
            return CGFloat(self.lineChartView.leftAxis.axisMinimum)
        }

        let set2 = LineChartDataSet(entries: values2, label: nil)
        set2.mode = .linear
        set2.setColor(#colorLiteral(red: 0.7620763183, green: 0.6782852411, blue: 0.9809553027, alpha: 1))
        set2.drawCirclesEnabled = false
        set2.lineWidth = 3
        set2.highlightEnabled = true
        set2.drawIconsEnabled = false
        set2.drawFilledEnabled = false
        set2.highlightEnabled = true
        set2.drawCircleHoleEnabled = false
        set2.highlightLineDashPhase = 2
        set2.highlightColor = UIColor(red: 244/255, green: 117/255, blue: 117/255, alpha: 1)
        set2.valueFont = .systemFont(ofSize: 9)
        set2.formLineWidth = 1
        set2.fillFormatter = DefaultFillFormatter { _,_  -> CGFloat in
            return CGFloat(self.lineChartView.leftAxis.axisMinimum)
        }
        
        let set3 = LineChartDataSet(entries: values3, label: nil)
        set3.mode = .linear
        
        set3.setColor(#colorLiteral(red: 0.466316998, green: 0.8900380731, blue: 0.980666101, alpha: 1))
        set3.drawCirclesEnabled = false
        set3.lineWidth = 3
        set3.highlightEnabled = true
        set3.drawIconsEnabled = false
        set3.drawFilledEnabled = false
        set3.highlightEnabled = true
        set3.drawCircleHoleEnabled = false
        set3.highlightLineDashPhase = 2
        set3.highlightColor = UIColor(red: 244/255, green: 117/255, blue: 117/255, alpha: 1)
        set3.valueFont = .systemFont(ofSize: 9)
        set3.formLineWidth = 1
        set3.fillFormatter = DefaultFillFormatter { _,_  -> CGFloat in
            return CGFloat(self.lineChartView.leftAxis.axisMinimum)
        }
        
        let data  = LineChartData(dataSets: [set1, set2, set3])
        data.setDrawValues(false)
      
      
        lineChartView.data = data
    }
    
}
